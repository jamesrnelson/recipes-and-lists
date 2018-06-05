class GroceryListPresenter
  attr_reader :id

  def initialize(id)
    binding.pry
    @id = id
  end

  def unformatted_ingredients
    binding.pry
    GroceryList.find(id.to_i).all_ingredients
  end

  def formatted_ingredients
    unformatted_ingredients.map do |ingredient|
      make_ingredient_corrections(ingredient)

      {
        'name': ingredient.name,
        'quantityList': [
          {
            'unit': ingredient.measurement.upcase,
            'amount': ingredient.quantity
          }
        ]
      }
    end
  end

  def make_ingredient_corrections(ingredient)
    case ingredient.measurement.upcase
    when 'TEASPOON'
      ingredient.measurement = 'TSP'
    when 'TABLESPOON'
      ingredient.measurement = 'TBSP'
    when 'TEASPOONS'
      ingredient.measurement = 'TSP'
    when 'TABLESPOONS'
      ingredient.measurement = 'TBSP'
    when 'CUP'
      ingredient.measurement = 'CUPS'
    when 'SERVINGS'
      ingredient.measurement = 'COUNT'
    when 'OUNCE'
      ingredient.measurement = 'OUNCES'
    when included?(ingredient.measurement.upcase)
      ingredient.measurement.upcase
    else
      ingredient.measurement = 'COUNT'
    end
  end

  def included?(measurement)
    accepted_measurements = %w[COUNT CLOVES SLICES STALKS LEAVES BUNCHES KILOGRAMS GRAMS POUNDS OUNCES PINCHES LITERS CENTILITERS MILLILITERS CC DROPS GALLONS QUARTS PINTS CUPS FL_OZ HEAPING_TBSP TBSP HEAPING_TSP TSP]
    accepted_measurements.include?(measurement)
  end

  def send_ingredients
    { ingredients: formatted_ingredients }.to_json
  end

  def buy_ingredients_from_amazon
    service.send_ingredients_to_amazon
  end

  private
    def service
      @service ||= AmazonPurchaseService.new(send_ingredients, id)
    end
end
