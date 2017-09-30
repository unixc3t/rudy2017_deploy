class Product < ApplicationRecord
  has_many :comments
  has_many :images, as: :imagable

  accepts_nested_attributes_for :images
end
