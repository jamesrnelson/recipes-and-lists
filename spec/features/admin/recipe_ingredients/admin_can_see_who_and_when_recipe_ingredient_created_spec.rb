require 'rails_helper'

describe 'Admin visits recipe show page' do
  it 'should see who created a recipe ingredient and when' do
    admin = create(:user, role: 'admin')
    recipe = create(:recipe)
    ingredient = create(:ingredient)

    recipe_ingredient = RecipeIngredient.create(
      quantity: '200',
      measurement: 'tbsp',
      recipe_id: recipe.id,
      ingredient_id: ingredient.id,
      creator_id: admin.id
    )

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(admin)

    visit recipe_path(recipe)

    expect(page).to have_content("Created by #{recipe_ingredient.creator.username} at #{recipe_ingredient.created_at}")
  end
end
