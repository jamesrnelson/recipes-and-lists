# Defines Admin Recipes Controller
class Admin::RecipesController < Admin::BaseController
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update

  end

  def destroy

  end
end
