# Defines Grocery List model
class GroceryList < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :grocery_list_recipes
  has_many :recipes, through: :grocery_list_recipes
end
