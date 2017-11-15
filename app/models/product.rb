class Product < ApplicationRecord
  include Redis::Objects
  include Likable
  serialize :like, Array

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :images, as: :imagable, inverse_of: :imagable, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :nested
  validates_uniqueness_of :name

  counter :view


  def nested(attributes)
    attributes['file'].blank?
  end
end
