require 'rails_helper'

describe 'Admin goes to recipe show' do
  context 'sees edit button next to each ingredient' do
    it 'should be able to edit the recipe ingredient' do
      admin = create(:user, role: 'admin')
      recipe = create(:recipe)
      ingredient = create(:ingredient)

      recipe_ingredient = RecipeIngredient.create(
        quantity: 200,
        measurement: 'tbsp',
        recipe_id: recipe.id,
        ingredient_id: ingredient.id
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(admin)

      visit recipe_path(recipe)

      expect(page).to have_content(recipe_ingredient.quantity)
      expect(page).to have_content(recipe_ingredient.measurement)
      expect(page).to have_content(ingredient.name)

      click_on 'Edit Ingredient'

      expect(current_path).to eq(edit_admin_recipe_recipe_ingredient_path(recipe_recipe_ingredient))

      fill_in 'admin_recipe[title]', with: 'New Recipe'
      fill_in 'admin_recipe[prep_time]', with: 100
      fill_in 'admin_recipe[cook_time]', with: 200
      fill_in 'admin_recipe[instructions]', with: 'DIRDDINR'

      click_on 'Update Recipe'

      expect(current_path).to eq(recipes_path)
      expect(page).to have_content('You have updated New Recipe')
      expect(page).to have_content('100')
      expect(page).to have_content('200')
      expect(page).to_not have_content(recipe.title)
    end
  end
end
