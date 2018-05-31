require 'rails_helper'

describe 'User adds recipes to Recipe Basket' do
  context 'visits recipe basket and clicks create grocery list' do
    it 'should create the grocery list' do
      user = create(:user)
      recipe = create(:recipe)
      ingredient = create(:ingredient)
      RecipeIngredient.new(
        ingredient_id: ingredient.id,
        recipe_id: recipe.id,
        quantity: 3,
        measurement: 'tbsp'
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      visit recipes_path

      click_on 'Add to Recipe Basket'

      visit basket_path
      fill_in 'grocery_list[title]', with: 'My first list!'

      click_on 'Create Grocery List'

      expect(current_path).to eq(grocery_lists_path)
      expect(page).to have_content('My first list!')
    end
  end
end
