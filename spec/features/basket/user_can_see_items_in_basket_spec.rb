require 'rails_helper'

describe 'User adds recipe to basket from dashboard' do
  it 'can see that item when they visit basket show page' do
    user = create(:user)
    recipe = create(:recipe)
    ingredient = create(:ingredient)
    recipe_ingredient = recipe.recipe_ingredients.create(
      ingredient_id: ingredient.id,
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
    expect(page).to have_content(recipe.title)
    expect(page).to have_content(recipe_ingredient.quantity)
    expect(page).to have_content(recipe_ingredient.measurement)
    expect(page).to have_content(ingredient.name)
  end
end
