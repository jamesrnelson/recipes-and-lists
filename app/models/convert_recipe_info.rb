class ConvertRecipeInfo
  attr_reader :user_id
  def initialize(id, user_id)
    @id = id
    @user_id = user_id
  end

  def attrs
    service.recipe_info
  end

  def recipe
    if Recipe.exists?(outside_recipe_id: id)
      @recipe = Recipe.find_by(outside_recipe_id: id)
    else
      @recipe = Recipe.create(
        title: attrs[:title],
        prep_time: attrs[:readyInMinutes]/2,
        cook_time: attrs[:readyInMinutes]/2,
        instructions: attrs[:instructions],
        outside_image: attrs[:image],
        creator_id: user_id,
        outside_recipe_id: attrs[:id],
        servings: attrs[:servings],
        source_name: attrs[:sourceName],
        source_url: attrs[:sourceUrl]
      )
    end
  end

  def create_recipe
    UserRecipe.create(recipe_id: recipe.id, user_id: user_id)
  end

  def create_ingredients
    attrs[:extendedIngredients].map do |ingredient|
      if Ingredient.exists?(name: ingredient[:name].downcase)
        ingredient_record = Ingredient.find_by(name: ingredient[:name].downcase)
        RecipeIngredient.create(
          creator_id: user_id,
          quantity: ingredient[:amount],
          measurement: ingredient[:unit],
          recipe_id: recipe.id,
          ingredient_id: ingredient_record.id
        )
      else
        ingredient_record = Ingredient.create(name: ingredient[:name].downcase, category: ingredient[:aisle])
        RecipeIngredient.create(
          creator_id: user_id,
          quantity: ingredient[:amount],
          measurement: ingredient[:unit],
          recipe_id: @recipe.id,
          ingredient_id: ingredient_record.id
        )
      end
    end
  end

  private
    attr_reader :id

    def service
      @service ||= OutsideRecipeInfoService.new(id, '/information')
    end
end
