require 'rails_helper'

describe 'User' do
  scenario 'logs in successfully' do
    user = User.create(
      username: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    within '#navbar' do
      click_link 'Log in'
    end

    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Logged in as #{user.username}")
    expect(current_path).to eq(dashboard_path)
  end

  scenario 'fails to log in' do
    user = User.create(
      username: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    within '#navbar' do
      click_link 'Log in'
    end

    click_button 'Log in'

    expect(page).to have_content('Unable to log in')
  end

  scenario 'can log out' do
    user = User.create(
      username: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    within '#navbar' do
      click_link 'Log in'
    end
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    within '#navbar' do
      click_on 'Log out'
    end

    expect(page).to have_content('You have logged out')
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content(user.email)
  end
end
