class Email < ApplicationRecord
    has_many :senders, class_name: "sender", foreign_key: "user_id"
    has_many :receivers, class_name: "receiver", foreign_key: "user_id"
    has_many :ccs, class_name: "cc", foreign_key: "user_id"
    has_many :bccs, class_name: "bcc", foreign_key: "user_id"
end
