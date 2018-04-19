# Defines Recipes Controller actions
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
