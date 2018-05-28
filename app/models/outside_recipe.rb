class OutsideRecipe
  attr_reader :title, :image, :creator, :instructions,
              :total_time, :servings, :ingredients

  def initialize(attrs)
    @title = attrs[:recipe][:label]
    @image = attrs[:recipe][:image]
    @creator = attrs[:recipe][:source]
    @instructions = attrs[:recipe][:url]
    @total_time = attrs[:recipe][:total_time]
    @servings = attrs[:recipe][:yield]
    @ingredients = attrs[:recipe][:ingredient_lines]
  end
end
