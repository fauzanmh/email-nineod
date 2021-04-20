class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :senders, class_name: "Sender", foreign_key: "user_id"
  has_many :receivers, class_name: "Receiver", foreign_key: "user_id"
  has_many :ccs, class_name: "Cc", foreign_key: "user_id"
  has_many :bccs, class_name: "Bcc", foreign_key: "user_id"
end
