class AddAmazonIdtoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :amazon_id, :string
  end
end
