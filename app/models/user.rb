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
end
