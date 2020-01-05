class Category < ApplicationRecord
  # バリデーション
  validates :name, presence: true
end
