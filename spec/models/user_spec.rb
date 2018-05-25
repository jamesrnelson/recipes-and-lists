require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'Relationships' do
    it { should have_many(:recipes) }
    it { should have_many(:user_recipes) }
    it { should have_many(:favorites) }
    it { should have_many(:grocery_lists) }
  end
end
