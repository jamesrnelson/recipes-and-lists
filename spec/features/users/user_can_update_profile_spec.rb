require 'rails_helper'

describe 'User can update profile' do
  context 'visits dashboard clicks update' do
    it 'should be able to fill in form and update' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_content("Logged in as #{user.username}")

      click_on 'Update Profile'

      fill_in 'user[username]', with: 'Jimmy'
      fill_in 'E-mail address', with: 'nelson.jimmy@gmail.com'
      fill_in 'Password', with: 'newpass'

      click_on 'Update Profile'
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Your profile information has been updated")
    end
  end
end

describe 'User tries and fails to update profile profile' do
  context 'visits dashboard clicks update' do
    it 'should get failure message when fails to fill in form' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_on 'Update Profile'

      click_on 'Update Profile'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content('You are missing required user information')
    end
  end
end
