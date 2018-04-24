require 'rails_helper'

describe RecipeIngredient, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:measurement) }
  end

  describe 'Relationships' do
    it { should belong_to(:ingredient) }
    it { should belong_to(:recipe) }
  end
end
