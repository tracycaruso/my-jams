require 'rails_helper'

RSpec.describe "user login" do
  context "with valid credentials" do
    it "shows user dashboard " do
      User.create(first_name: "Tracy",
                last_name: "Caruso",
                username:"ycart",
                password: "michelle",
                password_confirmation: "michelle" )
      visit login_path
      fill_in "session[username]", with: "ycart"
      fill_in "session[password]", with: "michelle"
      click_link_or_button "Login"

      expect(page).to have_content("Welcome Tracy")
    end
  end

  context "with invalid credentials" do
    it "shows user dashboard " do
      User.create(first_name: "Tracy",
                last_name: "Caruso",
                username:"ycart",
                password: "m",
                password_confirmation: "m" )
      visit login_path
      fill_in "session[username]", with: "ycart"
      fill_in "session[password]", with: "michelle"
      click_link_or_button "Login"

      expect(page).to have_content("Invalid login dummy!")
    end
  end
end
