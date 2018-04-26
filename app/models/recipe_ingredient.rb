# Defines Recipe Ingredient Model
class RecipeIngredient < ApplicationRecord
  validates :quantity, presence: true
  validates :measurement, presence: true

  belongs_to :recipe
  belongs_to :ingredient

  belongs_to :creator, :class_name => 'User'
end
