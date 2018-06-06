require 'rails_helper'

describe 'User visits /login' do
  context 'clicks on log in with amazon button' do
    it 'should be redirected to an amazon log in site', vcr: true do
      stub_omniauth

      visit root_path
      expect(page.status_code).to eq(200)

      click_on 'Log in'

      within '#LoginWithAmazon' do
        find(:xpath, "//a/img[@alt='Login with Amazon']/..").click
      end

      expect(current_path).to eq(recipes_path)
    end
  end
end
