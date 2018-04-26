# Defines User model
class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  enum role: %w[default admin]

  has_many :recipes, foreign_key: 'creator_id'
end
