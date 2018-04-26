# Defines User Recipes Controller actions
class UserRecipesController < ApplicationController
  def create
    recipe = Recipe.find(params[:user_recipe][:recipe_id])
    user_recipe = UserRecipe.new(user_recipe_params)
    if user_recipe.save
      flash[:success] = "You have added #{recipe.title} to your favorites"
    else
      flash[:error] = 'You were unable to add the recipe to your favorites'
    end
    redirect_to recipes_path
  end

  private

  def user_recipe_params
    params.require(:user_recipe).permit(:recipe_id, :user_id)
  end
end
