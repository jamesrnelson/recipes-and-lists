# Defines Sessions Controller actions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Unable to log in'
      render :new
    end
  end

  def destroy
    session.clear
    @current_user = nil
    flash[:notice] = 'You have logged out'
    redirect_to root_path
  end
end
