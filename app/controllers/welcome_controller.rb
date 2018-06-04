class WelcomeController < ApplicationController
  def index
    @random_recipes = OutsideRecipeInfo.new(nil, 'random?number=3').three_recipes
  end
end
