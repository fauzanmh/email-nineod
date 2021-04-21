class Email::ImportantController < Email::MainController
    def index
        fields = ['mail_id', 'important_status', 'trash_status', 'snoozed_status', 'starred_status']
        status = {important_status: true}

        s = sender.select(fields).where(status)
        r = receiver.select(fields).where(status)
        c = cc.select(fields).where(status)
        b = bcc.select(fields).where(status)

        @email = s + r + c + b

        render 'email/index'
    end

    def add_important
        s = sender_not_in_trash.where(mail_id: params[:mail_id]).first
        r = receiver_not_in_trash.where(mail_id: params[:mail_id]).first
        c = cc_not_in_trash.where(mail_id: params[:mail_id]).first
        b = bcc_not_in_trash.where(mail_id: params[:mail_id]).first

        if s.present?
            s.important_status = !s.important_status
            s.save
        elsif r.present?
            r.important_status = !r.important_status
            r.save
        elsif c.present?
            c.important_status = !c.important_status
            c.save
        elsif b.present?
            b.important_status = !b.important_status
            b.save
        end

        redirect_to root_path
    end
end