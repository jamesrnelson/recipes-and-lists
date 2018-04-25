# Defines Admin Recipe Ingredients Controller
class Admin::RecipeIngredientsController < Admin::BaseController
  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @ingredients = Ingredient.order(:name)
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    recipe = Recipe.find(params[:recipe_id])
    recipe_ingredient = RecipeIngredient.find(params[:id])
    recipe_ingredient.recipe_id = params[:recipe_id]
    if recipe_ingredient.update(recipe_ingredient_params)
      flash[:success] = "You updated #{recipe_ingredient.ingredient.name}"
      redirect_to recipe_path(recipe)
    else
      flash[:error] = 'You were unable to update the ingredient'
      render :edit
    end
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient)
          .permit(:quantity, :measurement, :ingredient_id)
  end
end
