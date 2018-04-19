require 'rails_helper'

describe 'User visits root path' do
  context 'clicks on Create Account' do
    it 'should be able to fill in the form and create an account' do
      visit root_path

      click_on 'Create Account'

      username = 'Jimmy'
      fill_in 'Username', with: username
      fill_in 'E-mail address', with: 'test@test.com'
      fill_in 'Password', with: 'test'

      click_on 'Create Account'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("You are logged in as #{username}")
    end
  end
end
