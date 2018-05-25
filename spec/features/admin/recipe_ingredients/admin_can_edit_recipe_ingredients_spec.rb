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
        ingredient_id: ingredient.id,
        creator_id: admin.id
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(admin)

      visit recipe_path(recipe)

      expect(page).to have_content(recipe_ingredient.quantity)
      expect(page).to have_content(recipe_ingredient.measurement)
      expect(page).to have_content(ingredient.name)

      click_on 'Edit Ingredient'

      expect(page).to have_content(recipe_ingredient.measurement)
      select(ingredient.name, from: 'recipe_ingredient[ingredient_id]')
      fill_in 'recipe_ingredient[quantity]', with: 500
      select('tsp', from: 'recipe_ingredient[measurement]')
      click_on 'Update Ingredient'

      expect(current_path).to eq(recipe_path(recipe))
      expect(page).to have_content("You updated #{ingredient.name}")
      expect(page).to have_content('500')
      expect(page).to_not have_content(recipe_ingredient.measurement)
    end
  end
end

describe 'Admin goes to recipe show' do
  context 'sees edit button next to each ingredient' do
    it 'should not be able to update the recipe ingredient if no info' do
      admin = create(:user, role: 'admin')
      recipe = create(:recipe)
      ingredient = create(:ingredient)

      recipe_ingredient = RecipeIngredient.create(
        quantity: 200,
        measurement: 'tbsp',
        recipe_id: recipe.id,
        ingredient_id: ingredient.id,
        creator_id: admin.id
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(admin)

      visit recipe_path(recipe)

      click_on 'Edit Ingredient'

      fill_in 'recipe_ingredient[quantity]', with: nil
      click_on 'Update Ingredient'

      expect(page).to have_content('You were unable to update the ingredient')
    end
  end
end
