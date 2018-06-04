# Defines Dashboard Controller actions
class DashboardController < ApplicationController
  def index
    @user = current_user
    @favorites = current_user.favorites.order("created_at ASC")
  end
end
