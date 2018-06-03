class OutsideRecipeListing
  def initialize(query, to=10)
    @query = query
  end

  def all_recipes
    raw_recipes = service.recipe_search
    raw_recipes.map do |recipe|
      OutsideRecipe.new(recipe)
    end
  end

  private
    attr_reader :query

    def service
      @service ||= OutsideRecipeService.new(query)
    end
end
