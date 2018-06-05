class AmazonPurchaseService
  attr_reader :id, :body

  def initialize(body, id)
    @body = body
    @id = id
  end

  def send_ingredients_to_amazon
    connection.post do |req|
      req.url '/landing'
      req.headers['Content-Type'] = 'application/json'
      req.headers['Origin'] = 'http://localhost:3000'
      req.headers['Referer'] = "http://localhost:3000/grocery_lists/"
      req.body = body
    end
  end

  private

  def connection
    Faraday.new(url: 'https://www.amazon.com/afx/ingredients')
  end
end
