# Defines Recipes Controller actions
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order('updated_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = 'You created a new recipe'
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = 'Unable to add new recipe'
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe)
          .permit(:title, :prep_time, :cook_time, :instructions, :image)
  end
end
