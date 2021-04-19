class Bcc < ApplicationRecord
    self.primary_key = 'mail_id'

    belongs_to :email, class_name: "email", foreign_key: "mail_id"
    belongs_to :user, class_name: "user", foreign_key: "user_id"
end
