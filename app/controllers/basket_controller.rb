# Defines Basket Controller Actions
class BasketController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    @basket.add_recipe(recipe.id)
    session[:cart] = @basket.contents
    flash[:success] = "You added #{recipe.title} to your shopping basket"
    redirect_to dashboard_path
  end
end
