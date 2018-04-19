# Defines Recipes Controller actions
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "You added #{@recipe.title}"
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = 'Unable to add new recipe'
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :prep_time, :cook_time, :instructions, :photo)
  end
end
