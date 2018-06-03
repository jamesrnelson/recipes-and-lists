require 'rails_helper'

describe 'User' do
  context 'has searched for outside recipes' do
    it 'should be able to add these recipes to favorites', vcr: true do
      user = create(:user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      stub_request(:get, "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?query=hominy").
        to_return(status: 200, body: File.read('./spec/fixtures/spoonacular_hominy_recipes.json'))

      visit recipes_path

      fill_in 'q', with: 'hominy'

      click_on 'Search'

      click_on 'Spicy Black Bean, Hominy and Kale Stew'

      find(:xpath, "//a/img[@alt='heart_icon']/..").click

      expect(page).to have_content("You added Spicy Black Bean, Hominy and Kale Stew to your favorites")
    end
  end
end
