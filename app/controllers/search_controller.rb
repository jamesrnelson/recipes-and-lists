class SearchController < ApplicationController
  def index
    @outside_recipes = OutsideRecipeListing.new(params[:q]).all_recipes
  end
end
