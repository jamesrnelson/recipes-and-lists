class OutsideRecipe
  attr_reader :title, :image, :creator, :instructions,
              :total_time, :servings, :ingredients

  def initialize(attrs)
    @title = attrs[:title]
    @image = "https://spoonacular.com/recipeImages/#{attrs[:imageUrls].first}"
    @spoonacular_id = attrs[:id]
    @total_time = attrs[:readyInMinutes]
    @servings = attrs[:servings]
  end
end
