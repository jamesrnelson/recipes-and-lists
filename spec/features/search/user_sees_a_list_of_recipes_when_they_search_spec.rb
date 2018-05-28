require 'rails_helper'

describe 'Registered User' do
  context 'Visits recipes index and fills in search form' do
    # let(:attrs) {
    #   {
    #     label: 'Chicken Satay',
    #     image: 'https://www.edamam.com/web-img/ba6/ba6f66d885e4d62a98055b088a5a85a3.jpg',
    #     source: 'BBC Food',
    #     url: 'http://www.bbcgoodfood.com/recipes/3645/',
    #     total_time: '60',
    #     yield: '4',
    #     ingredient_lines: [
    #           "100.0ml soy sauce (Kikkoman is good)",
    #           "4.0 tbsp smooth peanut butter",
    #           "4 skinless chicken breasts fillets"
    #       ]
    #   }
    # }
    #
    # subject { OutsideRecipe.new(attrs) }

    it 'should show a list of recipes from Edamam\'s API' do
      user = create(:user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.edamam.com/search?app_id=#{ENV['EDAMAM_APPLICATION_ID']}&app_key=#{ENV['EDAMAM_APPLICATION_KEY']}&q=chicken").
        to_return(status: 200, body: File.read('./spec/fixtures/edamam_chicken_recipes.json'))

      visit recipes_path

      fill_in 'q', with: 'chicken'

      click_on 'Search'

      expect(page).to have_css('.outside_recipe', count: 10)

      within(first('.outside-recipe')) do
        expect(page).to have_content('Teriyaki Chicken')
        expect(page).to have_content("https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg")
        expect(page).to have_content("David Lebovitz")
        expect(page).to have_content("http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/")
        expect(page).to have_content(0)
        expect(page).to have_content(6)
        expect(page).to have_content("1/2 cup (125ml) mirin")
        expect(page).to have_content("1/2 cup (125ml) soy sauce")
        expect(page).to have_content("One 2-inch (5cm) piece of fresh ginger, peeled and grated")
        expect(page).to have_content("2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)")
      end
    end
  end
end
