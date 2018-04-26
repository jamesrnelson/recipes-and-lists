require 'rails_helper'

describe 'User creates new ingredients' do
  context 'visits recipe show page' do
    it 'should be able to create new ingredient and add it' do
      user = create(:user)
      recipe = create(:recipe)
      ingredient = 'Parsley, fresh'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recipe_path(recipe)

      click_on 'Add Ingredients'

      click_on 'Create New Ingredient'
      fill_in 'Name', with: ingredient
      select('Produce', from: 'Category')
      click_on 'Create Ingredient'

      expect(page).to have_content("You created #{ingredient}")

      select(ingredient, from: 'recipe_ingredient[ingredient_id]')
      fill_in 'recipe_ingredient[quantity]', with: 1
      select('count', from: 'recipe_ingredient[measurement]')
      click_on 'Add Ingredient'
      click_on 'Done Adding Ingredients'

      expect(current_path).to eq(recipe_path(recipe))
      expect(page).to have_content(ingredient)
    end
  end
end
