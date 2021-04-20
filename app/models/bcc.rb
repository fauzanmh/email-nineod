class Bcc < ApplicationRecord
    self.primary_key = 'mail_id'

    belongs_to :email, class_name: "Email", foreign_key: "mail_id"
    belongs_to :user, class_name: "User", foreign_key: "user_id"
end
