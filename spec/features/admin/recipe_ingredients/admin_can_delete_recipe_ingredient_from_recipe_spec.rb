require 'rails_helper'

describe 'Admin goes to recipe show' do
  context 'sees delete button next to each ingredient' do
    it 'should be able to delete the recipe ingredient' do
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

      click_on 'Delete Ingredient'

      expect(page).to_not have_content(recipe_ingredient.measurement)
      expect(current_path).to eq(recipe_path(recipe))
      expect(page).to have_content("#{recipe_ingredient.ingredient.name} was successfully deleted from this recipe")
    end
  end
end
