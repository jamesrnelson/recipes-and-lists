class ConversionController < ApplicationController
  def create
    @converted_recipe = ConvertRecipeInfo.new(params[:outside_recipe_id], current_user.id)
    if @converted_recipe.create_recipe
      flash[:success] = "You added #{@converted_recipe.recipe.title} to your favorites"
      @converted_recipe.create_ingredients
    else
      flash[:error] = "Unable to add recipe to favorites"
    end
    redirect_to recipe_path(@converted_recipe.recipe)
  end
end
