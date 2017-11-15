class User < ApplicationRecord
  extend Devise::Models


  enum role: [:guest, :user, :admin, :super_admin], _prefix: :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable
         #:omniauthable, :omniauth_providers => [:facebook]
  has_many :comments, dependent: :destroy
  has_many :products, through: :comments
  has_many :auth_providers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :liked_products, class_name: 'Product'
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def full_name
    "#{first_name} #{last_name}"
  end

  before_validation do
    if self.password.blank?
      self.password = Devise.friendly_token
    end
  end

  after_initialize do
    self.role ||= User.roles[:user]
  end

  def full_name=(value)
    first_last_name = value.split(' ')
    self.first_name = first_last_name[0]
    self.last_name = first_last_name[1]
  end
end
