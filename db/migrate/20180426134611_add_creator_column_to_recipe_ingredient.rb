class AddCreatorColumnToRecipeIngredient < ActiveRecord::Migration[5.1]
  def change
    change_table :recipe_ingredients do |t|
      t.belongs_to :creator, foreign_key: { to_table: :users }
    end
  end
end
