class UserMailer < ApplicationMailer
  def registration_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Appetite!')
  end
end
