# Defines RecipeIngredients Controller
class RecipeIngredientsController < ApplicationController
  def new
    @recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.all
    @recipe = Recipe.find(params[:id])
  end
end
