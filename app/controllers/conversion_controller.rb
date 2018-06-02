class ConversionController < ApplicationController
  def create
    if Recipe.exists?(outside_recipe_id: params[:outside_recipe_id])
      binding.pry
      @recipe = Recipe.find_by(outside_recipe_id: params[:outside_recipe_id])
      @user_recipe = UserRecipe.create(recipe_id: @recipe.id, user_id: current_user.id)
    else
      @recipe = Recipe.create(
        title: params[:title],
        creator_id: params[:creator_id],
        prep_time: params[:prep_time],
        cook_time: params[:cook_time],
        outside_recipe_id: params[:outside_recipe_id],
        instructions: params[:instructions],
        image_file_name: "https://spoonacular.com/recipeImages/#{params[:image]}"
      )
      binding.pry
      @user_recipe = UserRecipe.create(recipe_id: @recipe.id, user_id: current_user.id)

    end
  end

  private

    def recipe_params
      params.require(:user_recipe).permit(:creator_id, :outside_recipe_id, :prep_time, :cook_time, :instructions, :image_file_name, :ingredients)
    end
end
