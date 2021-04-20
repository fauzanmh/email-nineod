class EmailController < ApplicationController
    before_action :authenticate_user!
    before_action :counting, only: [:inbox, :starred]

    def new
        @email = Email.new
    end

    def create
        @receiver = params[:receivers][:user_id]
        @cc = params[:ccs][:user_id]
        @bcc = params[:bccs][:user_id]
        
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
    end

    def add_important
        
    end
    
    def inbox
        @email = Receiver.where(user_id: current_user.id)
    end

    def starred
        @email = Receiver.where(user_id: current_user.id,starred_status: true,trash_status: false)
    end

    def snoozed
        @email = Receiver.where(user_id: current_user.id,snoozed_status: true)
    end

    def important
        @email = Receiver.where(user_id: current_user.id,important_status: true)
    end

    def sent
        @email = Sender.where(user_id: current_user.id)
    end

    def draft
        @email = Sender.joins(:email).where(user_id: current_user.id, email: {status: false})
    end

    private

    def resource_params_mail
       params_mail = params.require(:email).permit(:title, :message)
       params_mail[:name] = current_user.name
       params_mail
    end

    def resource_params_sender mail_id
        {
            mail_id: mail_id, user_id: current_user.id, name: current_user.name
        }
    end

    def resource_params_receiver mail_id, user_id
        {
            mail_id: mail_id, user_id: user_id
        }
    end
end
