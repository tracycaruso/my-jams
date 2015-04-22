require 'rails_helper'

RSpec.describe 'User logout' do
  context "when previously logged in" do
    it "logs out the user" do
      User.create(first_name: "Tracy",
                  last_name: "Caruso",
                  username:"ycart",
                  password: "michelle",
                  password_confirmation: "michelle")
      visit login_path
      fill_in "session[username]", with: "ycart"
      fill_in "session[password]", with: "michelle"
      click_link_or_button "Login"

      expect(page).to have_content("Welcome Tracy")

      click_link_or_button "Logout"

      expect(page).to have_content("Successfully logged out.")

    end

  end

end
