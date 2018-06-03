class OutsideIngredient
  attr_reader :quantity, :measurement, :name

  def initialize(attrs)
    @quantity = attrs[:amount]
    @measurement = attrs[:unit]
    @name = attrs[:name]
    @category = attrs[:aisle]
  end
end
