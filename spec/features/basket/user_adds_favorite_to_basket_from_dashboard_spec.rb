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

    click_on 'Add to Shopping Basket'

    expect(page).to have_content("You added #{recipe.title} to your shopping basket")
  end
end
