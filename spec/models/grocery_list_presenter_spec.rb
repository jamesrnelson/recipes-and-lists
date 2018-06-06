require 'rails_helper'

describe GroceryListPresenter do
  subject { GroceryListPresenter.new(13) }
  context 'instance methods' do
    context '#make_ingredient_corrections' do
      it 'should reformat units of measurement' do
        user = create(:user)
        ingredient = create(:ingredient)
        recipe = create(:recipe)
        improper_formats = %w[teaspoon teaspoons tablespoon tablespoons cup servings ounce 4-inch]
        expected_formats = %w[TSP TSP TBSP TBSP CUPS COUNT OUNCES COUNT]
        improper_ingredients = improper_formats.map do |improper_format|
          RecipeIngredient.create(
            creator_id: user.id,
            ingredient_id: ingredient.id,
            recipe_id: recipe.id,
            measurement: improper_format,
            quantity: 6
          )
        end

        properly_formatted_ingredients = improper_ingredients.map do |improper_ingredient|
          subject.make_ingredient_corrections(improper_ingredient)
        end

        expect(properly_formatted_ingredients).to eq(expected_formats)
      end
    end
  end
end
