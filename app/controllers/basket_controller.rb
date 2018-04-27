# Defines Basket Controller Actions
class BasketController < ApplicationController
  def show; end

  def create
    recipe = Recipe.find(params[:recipe_id])
    @basket.add_recipe(recipe.id)
    session[:basket] = @basket.contents
    flash[:success] = "You added #{recipe.title} to your recipe basket"
    redirect_to dashboard_path
  end
end
