# Defines User model
class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  enum role: %w[default admin]

  has_many :recipes, foreign_key: 'creator_id'

  has_many :user_recipes
  has_many :favorites, through: :user_recipes, source: :recipe
  has_many :grocery_lists

  before_save :downcase_email

  def self.from_omniauth(auth_info)
    where(email: auth_info[:info][:email]).first_or_create do |new_user|
      new_user.amazon_id          = auth_info.uid
      new_user.username           = auth_info.info.name
      new_user.email              = auth_info.info.email
      new_user.password           = SecureRandom.urlsafe_base64
    end
  end

  def downcase_email
    self.email = self.email.downcase
  end
end
