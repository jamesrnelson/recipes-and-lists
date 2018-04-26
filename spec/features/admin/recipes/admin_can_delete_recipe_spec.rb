require 'rails_helper'

describe 'Admin goes to recipe index' do
  context 'sees delete button' do
    it 'should be able to delete the recipe' do
      admin = create(:user, role: 'admin')
      recipe = create(:recipe)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(admin)

      visit recipes_path

      expect(page).to have_content(recipe.title)
      expect(page).to have_content(recipe.prep_time)
      expect(page).to have_content(recipe.cook_time)

      click_on 'Delete'

      expect(current_path).to eq(recipes_path)
      expect(page).to_not have_content(recipe.prep_time)
      expect(page).to_not have_content(recipe.cook_time)
    end
  end
end
