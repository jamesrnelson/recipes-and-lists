require 'rails_helper'

describe 'Unregistered user' do
  context 'tries to see grocery lists' do
    it 'should redirect and give a flash message' do
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

      visit grocery_lists_path

      expect(current_path).to eq(recipes_path)
      expect(page).to have_content('Create an account in order to create your own grocery lists.')
    end
  end
end
