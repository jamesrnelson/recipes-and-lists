class OutsideRecipeListing
  def initialize(query)
    @query = query
  end

  def all_recipes
    raw_recipes = service.recipe_search
    raw_recipes.each do |recipe|
      OutsideRecipe.new(recipe)
    end
  end

  private
    attr_reader :query

    def service
      @service ||= OutsideRecipeService.new(query)
    end
end
