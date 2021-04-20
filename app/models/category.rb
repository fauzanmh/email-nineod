class Category < ApplicationRecord
  has_many :emails, class_name: "Email", foreign_key: "category_id"
end
