require 'rails_helper'

describe 'Logged in user' do
  context 'visits recipes index' do
    it 'can make a new recipe' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recipes_path

      click_on 'Add New Recipe'

      expect(page).to have_content('Add ingredients on the next page')

      click_on 'Create Recipe'

      expect(page).to have_content('Unable to add new recipe')
    end
  end
end
