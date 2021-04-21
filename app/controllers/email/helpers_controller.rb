class Email::HelpersController < ApplicationController
    before_action :authenticate_user!
    before_action :counting, except: [:create, :add_important, :add_snoozed, :add_starred, :add_trash]

    private

    def resource_params_mail
       params_mail = params.require(:email).permit(:title, :message)
       params_mail[:name] = current_user.name
       params_mail[:status] = params[:button] == 'send' ? true : false
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

    def receiver_not_in_trash
        Receiver.with_user_not_in_trash(current_user)
    end
    
    def receiver
        Receiver.with_user(current_user)
    end

    def cc_not_in_trash
        Cc.with_user_not_in_trash(current_user)
    end
    
    def cc
        Cc.with_user(current_user)
    end

    def bcc_not_in_trash
        Bcc.with_user_not_in_trash(current_user)
    end
    
    def bcc
        Bcc.with_user(current_user)
    end
    
    def sender_not_in_trash
        Sender.with_user_not_in_trash(current_user)
    end

    def sender
        Sender.with_user(current_user)
    end
end