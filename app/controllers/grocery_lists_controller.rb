# Defines User Grocery List Controller Actions
class GroceryListsController < ApplicationController
  def index
    if current_user
      user = User.find(current_user.id)
      @grocery_lists = user.grocery_lists.order("created_at DESC")
    else
      flash[:error] = "Create an account in order to create your own grocery lists."
      redirect_to recipes_path
    end
  end

  def create
    if @basket.checkout(grocery_list_params)
      flash[:success] = 'Successfully created your new grocery list'
      @basket.clear
      session[:basket] = @basket.contents
      redirect_to grocery_lists_path
    else
      flash[:error] = 'You must add a title to your grocery list'
      redirect_to basket_path
    end
  end

  def show
    @grocery_list = GroceryListIngredientPresenter.new(current_user.id, params[:id])
    # user = User.find(current_user.id)
    # @grocery_list = user.grocery_lists.find(params[:id])
    # @ingredients = @grocery_list.all_ingredients
  end

  private

  def grocery_list_params
    params.require(:grocery_list).permit(:title)
  end
end
