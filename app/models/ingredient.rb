# Defines Ingredient model
class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :measurement, presence: true

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
