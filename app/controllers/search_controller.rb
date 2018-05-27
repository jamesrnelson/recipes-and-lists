class SearchController < ApplicationController
  def index
    @edamam_recipes = OutsideRecipeListing.new(params[:q])
  end
end
