# Defines Admin Recipes Controller
class Admin::RecipesController < Admin::BaseController
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

  def destroy

  end

  private

  def recipe_params
    params.require(:admin_recipe)
          .permit(:title, :prep_time, :cook_time, :instructions, :image)
  end
end
