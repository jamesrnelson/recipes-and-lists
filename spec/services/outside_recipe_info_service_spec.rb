require 'rails_helper'

describe OutsideRecipeInfoService do
  subject { OutsideRecipeInfoService.new("759372") }

  it 'exists' do
    expect(subject).to be_an OutsideRecipeInfoService
  end

  context 'instance methods' do
    context '#recipe_info' do
      it 'returns an array of hashes with recipe info', vcr: true do
        raw_search = subject.recipe_info

        expect(raw_search).to have_key :title
        expect(raw_search).to have_key :image
        expect(raw_search).to have_key :sourceName
        expect(raw_search).to have_key :sourceUrl
        expect(raw_search).to have_key :id
        expect(raw_search).to have_key :readyInMinutes
        expect(raw_search).to have_key :servings
        expect(raw_search).to have_key :instructions
        expect(raw_search).to have_key :extendedIngredients
      end
    end
  end
end
