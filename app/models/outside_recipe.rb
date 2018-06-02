class OutsideRecipe
  attr_reader :title, :image, :spoonacular_id,
              :total_time, :servings, :instructions, :source_name,
              :source_url, :image_url

  def initialize(attrs)
    @title = attrs[:title]
    @image = attrs[:image]
    @spoonacular_id = attrs[:id]
    @total_time = attrs[:readyInMinutes]
    @servings = attrs[:servings]
    @instructions = attrs[:instructions]
    @source_name = attrs[:sourceName]
    @source_url = attrs[:sourceUrl]
    @raw_ingredients = attrs[:extendedIngredients]
  end

  def ingredients
    @raw_ingredients.map do |ingredient|
      OutsideIngredient.new(ingredient)
    end
  end
end
