class AddOutsideImage < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :outside_image, :string
  end
end
