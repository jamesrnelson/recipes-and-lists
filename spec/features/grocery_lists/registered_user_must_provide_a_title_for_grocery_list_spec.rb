require 'rails_helper'

describe 'Registered User' do
  context 'accidentally tries to create a list without a title' do
    it 'should give a flash error' do
      user = create(:user)
      recipe = create(:recipe)
      ingredient = create(:ingredient)
      ingredient2 = create(:ingredient)
      recipe_ingredient = recipe.recipe_ingredients.create(
        ingredient_id: ingredient.id,
        quantity: 3,
        measurement: 'tbsp',
        creator_id: user.id
      )
      recipe_ingredient = recipe.recipe_ingredients.create(
        ingredient_id: ingredient2.id,
        quantity: 3,
        measurement: 'tbsp',
        creator_id: user.id
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      visit recipes_path

      click_on 'Add to Recipe Basket'
      visit basket_path

      click_on 'Create Grocery List'

      expect(current_path).to eq(basket_path)
      expect(page).to have_content('You must add a title to your grocery list')
    end
  end
end
