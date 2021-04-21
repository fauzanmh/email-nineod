class Email::SnoozedController < Email::MainController
    def index
        fields = ['mail_id', 'important_status', 'trash_status', 'snoozed_status', 'starred_status']
        status = {snoozed_status: true}

        s = sender_not_in_trash.select(fields).where(status)
        r = receiver_not_in_trash.select(fields).where(status)
        c = cc_not_in_trash.select(fields).where(status)
        b = bcc_not_in_trash.select(fields).where(status)

        @email = s + r + c + b

        render 'email/index'
    end

    def add_snoozed
        s = sender_not_in_trash.where(mail_id: params[:mail_id]).first
        r = receiver_not_in_trash.where(mail_id: params[:mail_id]).first
        c = cc_not_in_trash.where(mail_id: params[:mail_id]).first
        b = bcc_not_in_trash.where(mail_id: params[:mail_id]).first

        if s.present?
            s.snoozed_status = !s.snoozed_status
            s.save
        elsif r.present?
            r.snoozed_status = !r.snoozed_status
            r.save
        elsif c.present?
            c.snoozed_status = !c.snoozed_status
            c.save
        elsif b.present?
            b.snoozed_status = !b.snoozed_status
            b.save
        end

        redirect_to root_path
    end
end