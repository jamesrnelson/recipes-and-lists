class AddColumnsToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :source_name, :string
    add_column :recipes, :source_url, :string
  end
end
