class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :images, as: :imagable, inverse_of: :imagable, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :nested

  def nested(attributes)
    attributes['file'].blank?
  end
end
