# Defines RecipeIngredients Controller
class RecipeIngredientsController < ApplicationController
  def new
    @recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.order(:name)
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = Ingredient.order(:name)
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.creator_id = current_user.id
    if @recipe_ingredient.save
      flash[:success] = "You added #{@recipe_ingredient.ingredient.name}"
      redirect_to new_recipe_recipe_ingredient_path(@recipe)
    else
      flash[:error] = 'You were unable to add this ingredient'
      render :new
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    recipe_ingredient = RecipeIngredient.find(params[:id])
    if recipe_ingredient.destroy
      flash[:success] = "#{recipe_ingredient.ingredient.name} was successfully deleted from this recipe"
    else
      flash[:error] = "#{recipe_ingredient.ingredient.name} was not deleted from this recipe"
    end
    redirect_to recipe_path(recipe)
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient)
          .permit(:quantity, :measurement, :ingredient_id)
  end
end
