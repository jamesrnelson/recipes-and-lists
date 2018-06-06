class UserMailer < ApplicationMailer
  def registration_email(email, name)
    @name = name
    mail(to: email, subject: 'Welcome to Appetite!')
  end
end
