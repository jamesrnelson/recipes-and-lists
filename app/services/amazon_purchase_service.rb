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
      req.headers['Origin'] = 'https://damp-escarpment-50077.herokuapp.com'
      req.headers['Referer'] = "https://damp-escarpment-50077.herokuapp.com/grocery_lists#{id}"
      req.body = body
    end
  end

  private

  def connection
    Faraday.new(url: 'https://www.amazon.com/afx/ingredients')
  end
end
