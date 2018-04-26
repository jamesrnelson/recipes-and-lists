require 'rails_helper'

describe 'User visits recipe index' do
  context 'by clicking link in nav bar' do
    it 'should see all recipes' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      recipes = create_list(:recipe, 5)

      visit dashboard_path


      click_on 'See All Recipes'

      expect(current_path).to eq(recipes_path)
      expect(page).to have_content(recipes[0].title)
      expect(page).to have_content(recipes[1].prep_time)
      expect(page).to have_content(recipes[2].cook_time)
    end
  end
end
