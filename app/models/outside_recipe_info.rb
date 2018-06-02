class OutsideRecipeInfo
  def initialize(id)
    @id = id
  end

  def recipe
    OutsideRecipe.new(service.recipe_info)
  end

  private
    attr_reader :id

    def service
      @service ||= OutsideRecipeInfoService.new(id)
    end
end
