require 'rails_helper'

describe OutsideRecipeListing do
  subject { OutsideRecipeListing.new('hominy') }
  it 'exists' do
    expect(subject).to be_an OutsideRecipeListing
  end

  context 'instance methods' do
    context '#all_recipes' do
      it 'returns a collection of all recipes', vcr: true do
        expect(subject).to respond_to :all_recipes
        recipes = subject.all_recipes
        recipes.each do |recipe|
          expect(recipe).to be_an OutsideRecipe
        end
      end
    end
  end
end
