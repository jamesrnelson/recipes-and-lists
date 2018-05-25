# Degines Grocery List Recipe Model
class GroceryListRecipe < ApplicationRecord
  belongs_to :grocery_list
  belongs_to :recipe
end
