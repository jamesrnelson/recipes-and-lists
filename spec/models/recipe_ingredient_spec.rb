require 'rails_helper'

describe RecipeIngredient, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:measurement) }
  end

  describe 'Relationships' do
    it { should belong_to(:ingredient) }
    it { should belong_to(:recipe) }
  end

  describe 'instance methods' do
    context '#formatted_quantity' do
      it 'should reformat inappropriately formatted quantities' do
        ingredient = create(:ingredient)
        user = create(:user)
        recipe = create(:recipe)

        oi1 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1.0',
          measurement: 'teaspoons'
        )
        oi2 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '0.33',
          measurement: 'teaspoons'
        )
        oi3 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '0.66',
          measurement: 'teaspoons'
        )
        oi4 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1.33',
          measurement: 'teaspoons'
        )
        oi5 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1.66',
          measurement: 'teaspoons'
        )
        oi6 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '0.25',
          measurement: 'teaspoons'
        )
        oi7 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1.25',
          measurement: 'teaspoons'
        )
        oi8 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '0.5',
          measurement: 'teaspoons'
        )
        oi9 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1.5',
          measurement: 'teaspoons'
        )
        oi10 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '0.75',
          measurement: 'teaspoons'
        )
        oi11 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1.75',
          measurement: 'teaspoons'
        )
        oi12 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1.85',
          measurement: 'teaspoons'
        )
        oi13 = RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id,
          creator_id: user.id,
          quantity: '1',
          measurement: 'teaspoons'
        )

        expect(oi1.formatted_quantity).to eq('1')
        expect(oi2.formatted_quantity).to eq('1/3')
        expect(oi3.formatted_quantity).to eq('2/3')
        expect(oi4.formatted_quantity).to eq('1 1/3')
        expect(oi5.formatted_quantity).to eq('1 2/3')
        expect(oi6.formatted_quantity).to eq('1/4')
        expect(oi7.formatted_quantity).to eq('1 1/4')
        expect(oi8.formatted_quantity).to eq('1/2')
        expect(oi9.formatted_quantity).to eq('1 1/2')
        expect(oi10.formatted_quantity).to eq('3/4')
        expect(oi11.formatted_quantity).to eq('1 3/4')
        expect(oi12.formatted_quantity).to eq('1.85')
        expect(oi13.formatted_quantity).to eq('1')
      end
    end
  end
end
