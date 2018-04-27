require 'rails_helper'

describe 'User adds recipe to basket from dashboard' do
  it 'should show up in their basket' do
    user = create(:user)
    recipe = create(:recipe)

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    visit recipes_path

    click_on 'Add to Favorites'

    visit dashboard_path

    expect(page).to have_content('Recipe Basket: 0')

    click_on 'Add to Recipe Basket'

    expect(page).to have_content("You added #{recipe.title} to your recipe basket")
    expect(page).to have_content('Recipe Basket: 1')
  end
end
