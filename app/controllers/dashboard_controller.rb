# Defines Dashboard Controller actions
class DashboardController < ApplicationController
  def index
    @user = current_user
  end
end
