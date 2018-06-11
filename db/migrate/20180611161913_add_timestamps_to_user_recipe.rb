class AddTimestampsToUserRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :user_recipes, :created_at, :datetime
    add_column :user_recipes, :updated_at, :datetime
  end
end
