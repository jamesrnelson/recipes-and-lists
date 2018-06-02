require 'rails_helper'

describe 'User tries to add ingredients' do
  context 'does not add all required attributes' do
    it 'should not be able to create new ingredient' do
      user = create(:user)
      recipe = create(:recipe)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recipe_path(recipe)

      click_on 'Add Ingredients'

      click_on 'Create New Ingredient'
      click_on 'Create Ingredient'

      expect(page).to have_content("Unable to create new ingredient")
    end
  end
end
