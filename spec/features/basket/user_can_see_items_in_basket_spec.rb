require 'rails_helper'

describe 'User adds recipe to basket from dashboard' do
  it 'can see that item when they visit basket show page' do
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

    expect(page).to have_content(recipe.title)
    expect(page).to have_content(recipe_ingredient.quantity)
    expect(page).to have_content(recipe_ingredient.measurement)
    expect(page).to have_content(ingredient.name)
  end
end