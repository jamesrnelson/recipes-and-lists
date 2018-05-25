require 'rails_helper'

describe UserRecipe, type: :model do
  describe 'Relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
  end
end
