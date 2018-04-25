class DropQuantityFromRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipe_ingredients, :quantity, :float
  end
end
