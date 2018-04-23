require 'rails_helper'

describe 'User adds ingredients to recipe' do
  context 'visits recipe show page' do
    it 'should be able to add an ingredient' do
      recipe = create(:recipe)
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recipe_path(recipe)

      click_on 'Add Ingredients'

      select('Ingredient 1', from: 'ingredient[name]')
      click_on 'Add Ingredient'

      select('Ingredient 2', from: 'ingredient[name]')
      click_on 'Add Ingredient'
      click_on 'Done Adding Ingredients'

      expect(current_path).to eq(recipe_path(recipe))
      expect(page).to have_content('Ingredient 1')
      expect(page).to have_content('Ingredient 2')
    end
  end
end
