require 'rails_helper'

describe OutsideRecipeService do
  subject { OutsideRecipeService.new("hominy") }

  it 'exists' do
    expect(subject).to be_an OutsideRecipeService
  end

  context 'instance methods' do
    context '#recipe_search' do
      it 'returns an array of hashes with recipe data', vcr: true do
        raw_search = subject.recipe_search.first

        expect(raw_search).to have_key :title
        expect(raw_search).to have_key :image
        expect(raw_search).to have_key :id
        expect(raw_search).to have_key :readyInMinutes
        expect(raw_search).to have_key :servings
      end
    end
  end
end
