require 'rails_helper'

describe 'User' do
  it 'Receives registration email' do
    user = User.create(username: 'Jimmy', email: 'nelson.jimmy@gmail.com', password: 'password')

    UserMailer.registration_email(user.email, user.username).deliver_now

    email = ActionMailer::Base.deliveries.last

    expect(email.from).to eq(['no-reply@appetite.com'])
    expect(email.to).to eq([user.email])
    expect(email.subject).to eq('Welcome to Appetite!')
    expect(email.html_part.body.to_s).to have_content("Hi #{user.username}, thanks for signing up for an account!")
    expect(email.html_part.body.to_s).to have_content("Hi #{user.username}, thanks for signing up for an account!")
  end
end
