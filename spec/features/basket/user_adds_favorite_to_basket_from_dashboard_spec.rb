require 'rails_helper'

describe 'User adds recipe to basket from dashboard' do
  it 'should show up in their basket' do
    user = create(:user)
    recipe = create(:recipe)

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    visit recipes_path

    within '.recipe-item' do
      find(:xpath, "//a/img[@alt='heart_icon']/..").click
    end

    visit dashboard_path

    expect(page).to have_content('0')

    find(:xpath, "//a/img[@alt='add to basket']/..").click

    expect(page).to have_content("You added #{recipe.title} to your recipe basket")
    expect(page).to have_content('1')
  end
end
