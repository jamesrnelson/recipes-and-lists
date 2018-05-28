require 'rails_helper'

describe 'User' do
  context 'has searched for outside recipes' do
    it 'should be able to add these recipes to favorites' do
      user = create(:user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.edamam.com/search?app_id=#{ENV['EDAMAM_APPLICATION_ID']}&app_key=#{ENV['EDAMAM_APPLICATION_KEY']}&q=chicken").
        to_return(status: 200, body: File.read('./spec/fixtures/edamam_chicken_recipes.json'))

      visit recipes_path

      fill_in 'q', with: 'chicken'

      click_on 'Search'

      within(first('.outside-recipe')) do
        find(:xpath, "//a/img[@alt='heart_icon']/..").click
      end

      expect(page).to have_content("You added Teriyaki Chicken to your favorites.")
    end
  end
end
