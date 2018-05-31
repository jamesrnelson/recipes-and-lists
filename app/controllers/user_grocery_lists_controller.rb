# Defines User Grocery List Controller Actions
class UserGroceryListsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @grocery_lists = user.grocery_lists
  end

  def create
    if @basket.checkout(grocery_list_params)
      flash[:success] = 'Successfully created your new grocery list'
      @basket.clear
      session[:basket] = @basket.contents
      redirect_to dashboard_path
    else
      flash[:error] = 'You must add a title to your grocery list'
      redirect_to basket_path
    end
  end

  private

  def grocery_list_params
    params.require(:grocery_list).permit(:title)
  end
end
