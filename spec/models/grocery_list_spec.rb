require 'rails_helper'

describe GroceryList, type: :model do
  describe 'Relations' do
    it { should belong_to(:user) }
    it { should have_many(:grocery_list_recipes) }
    it { should have_many(:recipes) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end
end
