class AddCreatedByColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :created_by, :integer
  end
end
