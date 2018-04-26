require 'rails_helper'

describe 'User visits recipes index' do
  it 'should have a list of all recipes with pictures' do
    create(:user)
    recipes = create_list(:recipe, 5)

    visit recipes_path

    expect(page).to have_content(recipes.first.title)
    expect(page).to have_content(recipes.first.prep_time)
    expect(page).to have_content(recipes.first.cook_time)
    expect(page).to have_content(recipes.last.title)
    expect(page).to have_content(recipes.last.prep_time)
    expect(page).to have_content(recipes.last.cook_time)
  end
end
