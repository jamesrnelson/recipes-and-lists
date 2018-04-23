require 'rails_helper'

describe Ingredient, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:measurement) }
  end
end
