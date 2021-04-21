class Receiver < ApplicationRecord
    self.primary_key = 'mail_id'

    scope :with_user, ->(user) { joins(:email).where(:user => user, email: {:status => true})}
    scope :with_user_not_in_trash, ->(user) { joins(:email).where(:user => user, email: {:status => true}, :trash_status => false)}
    
    belongs_to :email, class_name: "Email", foreign_key: "mail_id"
    belongs_to :user, class_name: "User", foreign_key: "user_id"
end
