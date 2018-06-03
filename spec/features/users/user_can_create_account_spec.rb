require 'rails_helper'

describe 'User visits root path' do
  context 'clicks on Sign Up' do
    it 'should be able to fill in the form and create an account' do
      visit root_path

      within '#navbar' do
        click_on 'Sign up'
      end

      username = 'Jimmy'
      fill_in 'Username', with: username
      fill_in 'E-mail address', with: 'test@test.com'
      fill_in 'Password', with: 'test'

      click_on 'Create Account'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{username}")
    end
  end
end

describe 'User visits root path' do
  context 'clicks on Create Account' do
    it 'can not create new account without all info' do
      visit root_path

      click_on 'Create Account'

      click_on 'Create Account'

      expect(page).to have_content('Unable to create new account')
    end
  end
end
