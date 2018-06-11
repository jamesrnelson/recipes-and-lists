# Defines Dashboard Controller actions
class DashboardController < ApplicationController
  def index
    @user = current_user
    if current_user
      @favorites = current_user.user_recipes.order("created_at ASC")
    else
      flash[:error] = "Create an account in order to add recipes to your favorites."
      redirect_to recipes_path
    end
  end
end
