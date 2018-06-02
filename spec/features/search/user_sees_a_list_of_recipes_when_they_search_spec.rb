require 'rails_helper'

describe 'Registered User' do
  context 'Visits recipes index and fills in search form' do
    it 'should show a list of recipes from Edamam\'s API' do
      user = create(:user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      stub_request(:get, "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?query=hominy").
        to_return(status: 200, body: File.read('./spec/fixtures/spoonacular_hominy_recipes.json'))

      visit recipes_path

      fill_in 'q', with: 'hominy'

      click_on 'Search'

      expect(page).to have_css('.outside-recipe', count: 20)

      within(first('.outside-recipe')) do
        expect(page).to have_content('Spicy Black Bean, Hominy and Kale Stew')
        expect(page).to have_content(40)
        expect(page).to have_content(6)
      end
    end
  end
end
