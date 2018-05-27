class OutsideRecipeService
  def initialize(query)
    @query = query
  end

  def recipe_search
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :query

    def connection
      Faraday.new(url: "https://api.edamam.com/search?app_id=c9c1611b&app_key=58928c59bca6df2df541c916b71a9382&q=#{query}")
    end

    def response
      connection.get
    end
end
