require 'rails_helper'

describe 'Registered User' do
  context 'can go to recipe show page' do
    it 'should be able to see all ingredients' do
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

      within '.recipe-item' do
        find(:xpath, "//a/img[@alt='add to basket']/..").click
      end
      
      visit basket_path
      fill_in 'grocery_list[title]', with: 'My first list!'

      click_on 'Create Grocery List'
      click_on 'My first list!'

      expect(page).to have_content(ingredient.name)
      expect(page).to have_content(ingredient2.name)
    end
  end
end
