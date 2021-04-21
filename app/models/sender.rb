class Sender < ApplicationRecord
    self.primary_key = 'mail_id'

    scope :with_user_not_in_trash, ->(user) { where(:user => user, :trash_status => false)}
    scope :with_user, ->(user) { where(:user => user)}
    
   belongs_to :email, class_name: "Email", foreign_key: "mail_id"
   belongs_to :user, class_name: "User", foreign_key: "user_id"
end
