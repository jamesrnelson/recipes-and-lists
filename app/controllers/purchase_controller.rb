class PurchaseController < ApplicationController
  def create
    GroceryListPresenter.new(params[:id]).buy_ingredients_from_amazon
  end
end
