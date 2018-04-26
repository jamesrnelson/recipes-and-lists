class DropCreatedByColumnFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :created_by, :integer
  end
end
