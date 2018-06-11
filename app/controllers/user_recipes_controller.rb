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

  def destroy
    user_recipe = UserRecipe.find(params[:id])
    if user_recipe.destroy
      flash[:success] = "#{user_recipe.recipe.title} was successfully deleted from your favorites."
    else
      flash[:error] = "#{user_recipe.recipe.title} was not deleted from your favorites."
    end
    redirect_to dashboard_path
  end

  private

  def user_recipe_params
    params.require(:user_recipe).permit(:recipe_id, :user_id)
  end
end
