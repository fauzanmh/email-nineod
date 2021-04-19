class Category < ApplicationRecord
  has_many :emails, class_name: "email", foreign_key: "category_id"
end
