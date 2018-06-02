class OutsideRecipeInfoService
  def initialize(id)
    @id = id
  end

  def recipe_info
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :id

    def connection
      Faraday.new(url: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id}/information")
    end

    def response
      @response ||= connection.get do |req|
        req.headers['X-Mashape-Key'] = ENV['SPOONACULAR_API_KEY']
        req.headers['Accept'] = 'application/json'
      end
    end
end
