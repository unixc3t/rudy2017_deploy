class Comment < ApplicationRecord
  belongs_to :product

  validates :nick, :text, :product, presence: true
  validates :nick, length: { in: 3..12, message: '长度至少3' }
  validates :text, length: { maximum: 140 }
end
