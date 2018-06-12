# Defines Users Controller actions
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      RegistrationEmailSenderJob.perform_later(@user.email, @user.username)
      redirect_to dashboard_path
    else
      flash[:error] = 'Unable to create new account'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Your profile information has been updated'
      redirect_to dashboard_path
    else
      flash[:error] = 'You are missing required user information'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email.downcase, :password, :password_confirmation)
  end
end
