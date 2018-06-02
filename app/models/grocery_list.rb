# Defines Grocery List model
class GroceryList < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :grocery_list_recipes
  has_many :recipes, through: :grocery_list_recipes

  def date
    self.created_at.strftime("%B %-d, %Y")
  end

  def all_ingredients
    recipes.joins(:ingredients)
      .joins(:recipe_ingredients)
      .select("ingredients.name AS name, recipe_ingredients.quantity AS quantity, recipe_ingredients.measurement AS measurement")
      .order("name ASC")
      .distinct
  end
end
