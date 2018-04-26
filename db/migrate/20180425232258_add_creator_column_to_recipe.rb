class AddCreatorColumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    change_table :recipes do |t|
      t.belongs_to :creator, foreign_key: { to_table: :users }
    end
  end
end
