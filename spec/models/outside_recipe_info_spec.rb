require 'rails_helper'

describe OutsideRecipeInfo do
  subject { OutsideRecipeInfo.new('759372', 'information') }
  it 'exists' do
    expect(subject).to be_an OutsideRecipeInfo
  end

  context 'instance methods' do
    context '#recipe' do
      it 'should return the info for a single recipe', vcr: true do
        expect(subject).to respond_to :recipe
        recipe = subject.recipe
        expect(recipe).to be_an OutsideRecipe
      end
    end
  end
end
