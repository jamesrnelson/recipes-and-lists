class AddAttachmentColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_attachment :recipes, :image
  end
end
