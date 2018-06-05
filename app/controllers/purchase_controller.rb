class PurchaseController < ApplicationController
  def create
    GroceryListPresenter.new(params[:id]).buy_ingredients_from_amazon
    redirect_to 'https://www.amazon.com/afx/ingredients/landing'
  end
end
