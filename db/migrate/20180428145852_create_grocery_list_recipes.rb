class CreateGroceryListRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :grocery_list_recipes do |t|
      t.references :grocery_list, foreign_key: true
      t.references :recipe, foreign_key: true
    end
  end
end
