class OutsideRecipeInfo
  def initialize(id, path)
    @id = id
    @path = path
  end

  def recipe
    OutsideRecipe.new(service.recipe_info)
  end

  def three_recipes
    service.recipe_info[:recipes].map do |recipe|
      OutsideRecipe.new(recipe)
    end
  end

  private
    attr_reader :id, :path

    def service
      @service ||= OutsideRecipeInfoService.new(id, path)
    end
end
