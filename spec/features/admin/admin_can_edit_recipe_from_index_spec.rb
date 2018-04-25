require 'rails_helper'

describe 'Admin goes to recipe index' do
  context 'sees edit button' do
    it 'should be able to edit the recipe' do
      admin = create(:user, role: 'admin')
      recipe = create(:recipe)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit recipes_path

      expect(page).to have_content(recipe.title)
      expect(page).to_not have_content('100')
      expect(page).to_not have_content('200')

      click_on 'Edit'

      expect(current_path).to eq(edit_admin_recipe_path(recipe))

      fill_in 'Title', with: 'New Recipe'
      fill_in 'Prep time', with: 100
      fill_in 'Cook time', with: 200
      fill_in 'Instructions', with: 'DIRDDINR'

      click_on 'Update Recipe'

      expect(current_path).to eq(recipes_path)
      expect(page).to have_content('You have updated New Recipe')
      expect(page).to have_content('100')
      expect(page).to have_content('200')
      expect(page).to_not have_content(recipe.title)
    end
  end
end
