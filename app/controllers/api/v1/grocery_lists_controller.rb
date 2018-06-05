class Api::V1::GroceryListsController < ApiController
  def show
    render json: GroceryListPresenter.new(params[:id]).send_ingredients
  end
end
