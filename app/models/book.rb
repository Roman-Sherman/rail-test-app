class Book < ApplicationRecord
  belongs_to :format
  belongs_to :category

  # バリデーション
  validates :title, length: { in: 3..50 } # 3文字以上50文字以内
  validates :isbn, length: { in: 10..20 } # 10文字以上20文字以内
end
