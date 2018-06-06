require 'rails_helper'

describe 'User visits /login' do
  context 'clicks on log in with amazon button' do
    it 'should be redirected to an amazon log in site' do
      visit login_path

      click_on 'Login with Amazon'

      expect(page).to have_content("An error occurred when we tried to process your request. Rest assured, we're already working on the problem and expect to resolve it shortly.")
    end
  end
end
