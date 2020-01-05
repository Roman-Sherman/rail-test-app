class Format < ApplicationRecord
  # バリデーション
  validates :name, presence: true
end
