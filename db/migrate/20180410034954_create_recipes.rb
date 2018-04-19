class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :prep_time
      t.integer :cook_time
      t.text :instructions
      t.string :photo

      t.timestamps
    end
  end
end
