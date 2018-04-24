class RemoveMeasurementColumnFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :measurement, :string
  end
end
