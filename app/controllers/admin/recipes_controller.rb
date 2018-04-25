# Defines Admin Recipes Controller
class Admin::RecipesController < Admin::BaseController
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update(recipe_params)
      flash[:success] = "You have updated #{recipe.title}"
      redirect_to recipes_path
    else
      flash[:error] = 'You were unable to update the recipe'
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:success] = "Recipe #{recipe.title} was successfully deleted"
    else
      flash[:error] = "Recipe #{recipe.title} was not deleted"
    end
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:admin_recipe)
          .permit(:title, :prep_time, :cook_time, :instructions, :image)
  end
end
