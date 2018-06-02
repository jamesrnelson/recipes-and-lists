class AddColumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :outside_recipe_id, :string
  end
end
