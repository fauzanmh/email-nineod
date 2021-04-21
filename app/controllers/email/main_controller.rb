class Email::MainController < Email::HelpersController
    def inbox
        fields = ['mail_id', 'important_status', 'trash_status', 'snoozed_status', 'starred_status']

        r = receiver_not_in_trash.select(fields)
        c = cc_not_in_trash.select(fields)
        b = bcc_not_in_trash.select(fields)

        @email = r + c + b

        render 'email/index'
    end

    def new
        @email = Email.new

        render 'email/new'
    end

    def create
        button = params[:button]
        @receiver = params[:receivers][:user_id]
        @cc = params[:ccs][:user_id]
        @bcc = params[:bccs][:user_id]

        if button == 'send' || button == 'draft'
            begin
                ActiveRecord::Base.transaction do
                    @email = Email.create(resource_params_mail)
                    
                    mail_id = @email.id
                    
                    @receivers = User.find_by(email: @receiver)
                    @ccs = User.find_by(email: @cc)
                    @bccs = User.find_by(email: @bcc)

                    @senders = Sender.create(resource_params_sender(mail_id))
                
                    if @receivers
                        Receiver.create(resource_params_receiver mail_id, @receivers.id)
                    end
                    
                    if @ccs
                        Cc.create(resource_params_receiver mail_id, @ccs.id)
                    end
                    
                    if @bccs
                        Bcc.create(resource_params_receiver mail_id, @bccs.id)
                    end
                end

                redirect_to inbox_path
            rescue ActiveRecord::RecordInvalid => invalid
                render 'email/new'
            end
        elsif button == 'update-draft'
            begin
                ActiveRecord::Base.transaction do
                    @email = Email.find(params[:id])
                    @email.update(resource_params_mail)
                end
            
                redirect_to drafts_path
            rescue ActiveRecord::RecordInvalid => invalid
                render 'email/new'
            end

        end
    end

    def detail
        email = Email.find(params[:id])

        if email.blank?
            redirect_to inbox_path
        end

        @email = email

        @sender = email.senders.where(user: current_user).first
        @receiver = email.receivers.where(user: current_user).first
        @cc = email.ccs.where(user: current_user).first
        @bcc = email.bccs.where(user: current_user).first
        
        if @sender.blank? && @receiver.blank? && @cc.blank? && bcc.blank?
            redirect_to inbox_path
        end
        
        owner = @sender || @receiver || @cc || @bcc
        owner.read_status = true
        owner.save

        render 'email/detail'
    end

    def sent
        @email = sender_not_in_trash.joins(:email).where(email: {status: true})

        render 'email/index'
    end

    def draft
        @email = sender_not_in_trash.joins(:email).where(email: {status: false})

        render 'email/index'
    end

    def edit_draft
        @email = Email.joins(:senders).where(id: params[:id], senders: {user: current_user}).first

        render 'email/edit_draft'
    end
end