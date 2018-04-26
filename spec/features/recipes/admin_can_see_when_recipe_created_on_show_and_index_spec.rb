require 'rails_helper'

describe 'Admin visits recipe show page' do
  it 'should say when created' do
    admin = create(:user, role: 'admin')
    recipe = create(:recipe)

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(admin)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.created_at)
  end
end

describe 'Admin visits recipe index page' do
  it 'should say when created' do
    admin = create(:user, role: 'admin')
    recipe = create(:recipe)

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(admin)

    visit recipes_path

    expect(page).to have_content(recipe.created_at)
  end
end
