class Product < ApplicationRecord
  include Redis::Objects

  serialize :like, Array

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :images, as: :imagable, inverse_of: :imagable, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :nested
  validates_uniqueness_of :name

  counter :view

=begin
  def likes
    like.present? ? JSON.parse(like) : []
  end
=end


  def add_like(liker)
    like << liker.id
  end

  def add_like!(liker)
    add_like(liker)
    save
  end

  def unlike!(liker)
    unlike(liker)
    save
  end

  def unlike(liker)
    like.delete(liker.id)
  end

  def nested(attributes)
    attributes['file'].blank?
  end
end
