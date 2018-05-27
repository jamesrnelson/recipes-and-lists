require 'rails_helper'

describe OutsideRecipe do
  let(:attrs) {
    {
      label: 'Chicken Satay',
      image: 'https://www.edamam.com/web-img/ba6/ba6f66d885e4d62a98055b088a5a85a3.jpg',
      source: 'BBC Food',
      url: 'http://www.bbcgoodfood.com/recipes/3645/',
      total_time: '60',
      yield: '4',
      ingredient_lines: [
            "100.0ml soy sauce (Kikkoman is good)",
            "4.0 tbsp smooth peanut butter",
            "4 skinless chicken breasts fillets"
        ]
    }
  }

  subject { OutsideRecipe.new(attrs) }
  it 'exists' do
    expect(subject).to be_an OutsideRecipe
  end

  it 'instance methods' do
    it '#title' do
      expect(subject.title).to eq('Chicken Satay')
    end

    it '#image' do
      expect(subject.image).to eq('https://www.edamam.com/web-img/ba6/ba6f66d885e4d62a98055b088a5a85a3.jpg')
    end

    it '#creator' do
      expect(subject.creator).to eq('BBC Food')
    end

    it '#instructions' do
      expect(subject.instructions).to eq('http://www.bbcgoodfood.com/recipes/3645/')
    end

    it '#total_time' do
      expect(subject.total_time).to eq('60')
    end

    it '#servings' do
      expect(subject.servings).to eq('4')
    end

    it '#ingredients' do
      expect(subject.ingredients[0]).to eq('100.0ml soy sauce (Kikkoman is good)')
      expect(subject.ingredients[1]).to eq('4.0 tbsp smooth peanut butter')
      expect(subject.ingredients[2]).to eq('4 skinless chicken breasts fillets')
    end
  end
end
