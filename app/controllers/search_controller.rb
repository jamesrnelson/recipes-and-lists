class SearchController < ApplicationController
  def index
    @edamam_recipes = EdamamRecipeListing.new(params[:q])
  end
end
