class Email::TrashController < Email::MainController
    def index
        fields = ['mail_id', 'important_status']
        status = {trash_status: true}

        s = sender.select(fields).where(status)
        r = receiver.select(fields).where(status)
        c = cc.select(fields).where(status)
        b = bcc.select(fields).where(status)
        
        @email = s + r + c + b

        render 'email/index'
    end

    def add_trash
        s = sender.where(mail_id: params[:mail_id]).first
        r = receiver.where(mail_id: params[:mail_id]).first
        c = cc.where(mail_id: params[:mail_id]).first
        b = bcc.where(mail_id: params[:mail_id]).first

        if s.present?
            s.trash_status = !s.trash_status
            s.snoozed_status = !s.snoozed_status
            s.starred_status = !s.starred_status
            s.save
        elsif r.present?
            r.trash_status = !r.trash_status
            r.snoozed_status = !r.snoozed_status
            r.starred_status = !r.starred_status
            r.save
        elsif c.present?
            c.trash_status = !c.trash_status
            c.snoozed_status = !c.snoozed_status
            c.starred_status = !c.starred_status
            c.save
        elsif b.present?
            b.trash_status = !b.trash_status
            b.snoozed_status = !b.snoozed_status
            b.starred_status = !b.starred_status
            b.save   
        end

        redirect_to root_path
    end
end