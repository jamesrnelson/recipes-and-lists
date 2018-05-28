class OutsideRecipeService
  def initialize(query)
    @query = query
  end

  def recipe_search
    JSON.parse(response.body, symbolize_names: true)[:hits]
  end

  private
    attr_reader :query

    def connection
      Faraday.new(url: "https://api.edamam.com/search?app_id=#{ENV['EDAMAM_APPLICATION_ID']}&app_key=#{ENV['EDAMAM_APPLICATION_KEY']}&q=#{query}")
    end

    def response
      connection.get
    end
end
