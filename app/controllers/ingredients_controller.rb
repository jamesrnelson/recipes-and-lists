# Defines Ingredients controller actions
class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @recipe = Recipe.find(params[:recipe_id])
    if @ingredient.save
      flash[:success] = "You created #{@ingredient.name}"
      redirect_to new_recipe_recipe_ingredient_path(@recipe)
    else
      flash[:error] = 'Unable to create new ingredient'
      render :new
    end
  end

  private

  def ingredient_params
    params.permit(:name, :category)
  end
end
