require 'rails_helper'

describe 'Registered User' do
  context 'Visits recipes index and fills in search form' do
    it 'should show a list of recipes from Edamam\'s API' do
      user = create(:user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.edamam.com/search?app_id=#{ENV['EDAMAM_APPLICATION_ID']}&app_key=#{ENV['EDAMAM_APPLICATION_KEY']}&q=chicken").
        to_return(status: 200, body: File.read('./spec/fixtures/edamam_chicken_recipes.json'))

      visit recipes_path

      fill_in 'q', with: 'chicken'

      click_on 'Search'

      expect(page).to have_css('.outside-recipe', count: 10)

      within(first('.outside-recipe')) do
        expect(page).to have_content('Teriyaki Chicken')
        expect(page).to have_content("David Lebovitz")
        expect(page).to have_content("See the original recipe here")
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
