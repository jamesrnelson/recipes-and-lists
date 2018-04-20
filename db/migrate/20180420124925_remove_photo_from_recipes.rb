class RemovePhotoFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :photo, :string
  end
end
