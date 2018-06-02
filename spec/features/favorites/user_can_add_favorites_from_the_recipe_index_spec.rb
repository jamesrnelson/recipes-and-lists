require 'rails_helper'

describe 'User visits recipe index' do
  context 'sees link next to each recipe to add to favorites list' do
    it 'should click the link and now that recipe is in user dashboard' do
      user = create(:user)
      recipe = create(:recipe)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      visit recipes_path

      expect(page).to have_content(recipe.title)

      within '.recipe-item' do
        find(:xpath, "//a/img[@alt='heart_icon']/..").click
      end

      expect(page).to have_content("You have added #{recipe.title} to your favorites")
      expect(current_path).to eq(recipes_path)

      visit dashboard_path

      expect(page).to have_content(recipe.title)
    end
  end
end
