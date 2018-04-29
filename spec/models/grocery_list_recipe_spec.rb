require 'rails_helper'

describe GroceryListRecipe, type: :model do
  describe 'Relationships' do
    it { should belong_to(:grocery_list) }
    it { should belong_to(:recipe) }
  end
end
