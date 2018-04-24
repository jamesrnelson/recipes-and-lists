class AddMeasurementColumnToRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_ingredients, :measurement, :string
  end
end
