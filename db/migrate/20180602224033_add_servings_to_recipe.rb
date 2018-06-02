class AddServingsToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :servings, :string
  end
end
