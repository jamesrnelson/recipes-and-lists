class OutsideRecipeService
  def initialize(query)
    @query = query
  end

  def recipe_search
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  private
    attr_reader :query

    def connection
      Faraday.new(url: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?query=#{query}")
    end

    def response
      @response ||= connection.get do |req|
        req.headers['X-Mashape-Key'] = ENV['SPOONACULAR_API_KEY']
        req.headers['Accept'] = 'application/json'
      end
    end
end
