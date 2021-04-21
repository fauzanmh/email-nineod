class Email::StarredController < Email::MainController
    def index
        fields = ['mail_id', 'important_status', 'trash_status', 'snoozed_status', 'starred_status']
        status = {starred_status: true}

        s = sender_not_in_trash.select(fields).where(status)
        r = receiver_not_in_trash.select(fields).where(status)
        c = cc_not_in_trash.select(fields).where(status)
        b = bcc_not_in_trash.select(fields).where(status)

        @email = s + r + c + b

        render 'email/index'
    end

    def add_starred
        s = sender_not_in_trash.where(mail_id: params[:mail_id]).first
        r = receiver_not_in_trash.where(mail_id: params[:mail_id]).first
        c = cc_not_in_trash.where(mail_id: params[:mail_id]).first
        b = bcc_not_in_trash.where(mail_id: params[:mail_id]).first

        if s.present?
            s.starred_status = !s.starred_status
            s.save
        elsif r.present?
            r.starred_status = !r.starred_status
            r.save
        elsif c.present?
            c.starred_status = !c.starred_status
            c.save
        elsif b.present?
            b.starred_status = !b.starred_status
            b.save
        end

        redirect_to root_path
    end
end