require 'rails_helper'

describe EdamamRecipeListing do
  subject { EdamamRecipeListing.new('chicken') }
  it 'exists' do
    expect(subject).to be_an EdamamRecipeListing
  end

  context 'instance methods' do
    context '#all_recipes' do
      it 'returns a collection of all recipes' do
        expect(subject).to respond_to :all_recipes
        subject.all_recipes.each do |recipe|
          expect(recipe).to be_an EdamamRecipe
        end
      end
    end
  end
end
