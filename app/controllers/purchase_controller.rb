class PurchaseController < ApplicationController
  def create
    GroceryListPresenter.new(params[:id]).buy_ingredients_from_amazon
    flash[:notice] = 'This feature is coming soon!'
    redirect_to grocery_list_path(params[:id])
  end
end
