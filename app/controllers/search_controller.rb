class SearchController < ApplicationController
  def index
    @outside_recipes = OutsideRecipeListing.new(params[:q]).all_recipes
  end

  def show
    @outside_recipe = OutsideRecipeInfo.new(params[:id]).recipe
  end
end
