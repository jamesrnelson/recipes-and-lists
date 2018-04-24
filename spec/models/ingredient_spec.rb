require 'rails_helper'

describe Ingredient, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }
  end

  describe 'Relationships' do
    it { should have_many(:recipe_ingredients) }
    it { should have_many(:recipes) }
  end
end
