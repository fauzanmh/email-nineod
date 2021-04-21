class Email < ApplicationRecord
    has_many :senders, class_name: "Sender", foreign_key: "mail_id"
    has_many :receivers, class_name: "Receiver", foreign_key: "mail_id"
    has_many :ccs, class_name: "Cc", foreign_key: "mail_id"
    has_many :bccs, class_name: "Bcc", foreign_key: "mail_id"

    validates :title, length: {maximum: 255}, presence: true
end
