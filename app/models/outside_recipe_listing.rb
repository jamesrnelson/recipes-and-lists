class OutsideRecipeListing
  def initialize(query)
    @query = query
  end

  private
    attr_reader :query

    def service
      @service = OutsideRecipeService.new(query)
    end
end
