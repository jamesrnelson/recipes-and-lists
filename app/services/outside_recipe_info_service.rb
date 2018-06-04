class OutsideRecipeInfoService
  def initialize(id, path)
    @id = id
    @path = path
  end

  def recipe_info
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :id, :path

    def connection
      Faraday.new(url: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id}#{path}")
    end

    def response
      @response ||= connection.get do |req|
        req.headers['X-Mashape-Key'] = ENV['SPOONACULAR_API_KEY']
        req.headers['Accept'] = 'application/json'
      end
    end
end
