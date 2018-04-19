require 'rails_helper'

describe 'User' do
  scenario 'logs in successfully' do
    user = User.create(
      username: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    click_link 'Log in'
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Welcome back, #{user.username}")
    expect(current_path).to eq(user_path(user))
  end

  scenario 'can log out' do
    user = User.create(
      username: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    click_link 'Log in'
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_on 'Log out'

    expect(page).to have_content('You have been successfully logged out!')
    expect(current_path).to eq(sessions_path)
    expect(page).to_not have_content(user.email)
  end
end
