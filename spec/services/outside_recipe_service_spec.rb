require 'rails_helper'

describe OutsideRecipeService do
  subject { OutsideRecipeService.new("chicken") }

  it 'exists' do
    expect(subject).to be_an OutsideRecipeService
  end

  context 'instance methods' do
    context '#recipe_search' do
      it 'returns an array of hashes with recipe data', vcr: true do
        raw_search = subject.recipe_search
        raw_recipes = raw_search
        raw_recipe = raw_recipes[4][:recipe]

        expect(raw_recipe).to have_key :label
        expect(raw_recipe).to have_key :image
        expect(raw_recipe).to have_key :source
        expect(raw_recipe).to have_key :url
        expect(raw_recipe).to have_key :yield
        expect(raw_recipe).to have_key :ingredientLines
      end
    end
  end
end
