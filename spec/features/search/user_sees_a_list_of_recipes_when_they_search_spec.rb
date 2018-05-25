require 'rails_helper'

describe 'Registered User' do
  context 'Visits recipes index and fills in search form' do
    let(:attrs) {
      {
        label: 'Yummy Chicken',
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

    it 'should show a list of recipes from Edamam\'s API' do
      user = create(:user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      visit recipes_path

      fill_in 'q', with: 'chicken'

      click_on 'Search'

      expect(page).to have_content(subject.title)
      expect(page).to have_content(subject.image)
      expect(page).to have_content(subject.creator)
      expect(page).to have_content(subject.instructions)
      expect(page).to have_content(subject.total_time)
      expect(page).to have_content(subject.servings)
      expect(page).to have_content(subject.ingredients[0])
      expect(page).to have_content(subject.ingredients[1])
      expect(page).to have_content(subject.ingredients[2])
    end
  end
end
