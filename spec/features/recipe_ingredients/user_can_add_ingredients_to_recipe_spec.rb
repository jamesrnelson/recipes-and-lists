require 'rails_helper'

describe 'User adds ingredients to recipe' do
  context 'visits recipe show page' do
    it 'should be able to add an ingredient' do
      recipe = create(:recipe)
      user = create(:user)
      ingredients = create_list(:ingredient, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recipe_path(recipe)

      click_on 'Add Ingredients'

      select(ingredients[0].name, from: 'recipe_ingredient[ingredient_id]')
      fill_in 'recipe_ingredient[quantity]', with: 1
      select('tsp', from: 'recipe_ingredient[measurement]')
      click_on 'Add Ingredient'

      select(ingredients[1].name, from: 'recipe_ingredient[ingredient_id]')
      fill_in 'recipe_ingredient[quantity]', with: 1
      select('tsp', from: 'recipe_ingredient[measurement]')
      click_on 'Add Ingredient'
      click_on 'Done Adding Ingredients'

      expect(current_path).to eq(recipe_path(recipe))
      expect(page).to have_content(ingredients[0].name)
      expect(page).to have_content(ingredients[1].name)
    end
  end
end

describe 'User tries to add ingredient' do
  context 'does not add all fields' do
    it 'should not be able to add an ingredient without all fields' do
      recipe = create(:recipe)
      user = create(:user)
      ingredients = create_list(:ingredient, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recipe_path(recipe)

      click_on 'Add Ingredients'

      select(ingredients[0].name, from: 'recipe_ingredient[ingredient_id]')
      click_on 'Add Ingredient'

      expect(page).to have_content('You were unable to add this ingredient')
    end
  end
end
