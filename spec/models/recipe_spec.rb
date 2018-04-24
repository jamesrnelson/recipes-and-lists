require 'rails_helper'

describe Recipe, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:prep_time) }
    it { should validate_presence_of(:cook_time) }
    it { should validate_presence_of(:instructions) }
  end

  describe 'Relationships' do
    it { should have_many(:recipe_ingredients) }
    it { should have_many(:ingredients) }
  end
end
