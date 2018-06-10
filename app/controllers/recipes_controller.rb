# Defines Recipes Controller actions
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order('updated_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "You have updated #{@recipe.title}"
      redirect_to recipes_path
    else
      flash[:error] = 'You were unable to update the recipe'
      render :edit
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.creator_id = current_user.id
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
