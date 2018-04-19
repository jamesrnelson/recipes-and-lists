class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = 'Unable to Login'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = 'You have logged out'
    redirect_to root_path
  end
end
