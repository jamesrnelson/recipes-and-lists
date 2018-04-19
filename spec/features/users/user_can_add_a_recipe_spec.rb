require 'rails_helper'

describe 'Logged in user' do
  context 'visits recipes index' do
    it 'can make a new recipe' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recipes_path

      click_on 'Add New Recipe'

      expect(page).to have_content('Add ingredients on the next page')
      fill_in 'Title', with: 'Mac n Cheese'
      fill_in 'Cook time', with: 30
      fill_in 'Prep time', with: 20
      fill_in 'Instructions', with: 'Do some stuff'
      save_and_open_page
      
      click_on 'Create Recipe'

      expect(page).to have_content('You created a new recipe')
      expect(page).to have_content('Mac n Cheese')
    end
  end
end
