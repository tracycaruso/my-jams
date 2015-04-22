require 'rails_helper'

RSpec.describe 'creates a user' do
  context 'with valid attributes' do
    it "saves and displays a user" do
      visit new_user_path
      fill_in "user[first_name]", with: "Tracy"
      fill_in "user[last_name]", with: "Caruso"
      fill_in "user[username]", with: "ycart"
      fill_in "user[password]", with: "michelle"
      fill_in "user[password_confirmation]", with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content('Welcome Tracy')
    end
  end


  context 'with invalid attributes' do
    it "tells user when username has already been taken" do
      visit new_user_path
      fill_in "user[first_name]", with: "Tracy"
      fill_in "user[last_name]", with: "Caruso"
      fill_in "user[username]", with: "ycart"
      fill_in "user[password]", with: "michelle"
      fill_in "user[password_confirmation]", with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content('Welcome Tracy')
      visit new_user_path
      fill_in "user[first_name]", with: "Tracy"
      fill_in "user[last_name]", with: "Caruso"
      fill_in "user[username]", with: "ycart"
      fill_in "user[password]", with: "michelle"
      fill_in "user[password_confirmation]", with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content("Username has already been taken First name Last name Username Password Password confirmation")
    end

    it "tells first name hasnt been submited" do
      visit new_user_path
      fill_in "user[first_name]", with: nil
      fill_in "user[last_name]", with: "Caruso"
      fill_in "user[username]", with: "ycart"
      fill_in "user[password]", with: "michelle"
      fill_in "user[password_confirmation]", with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content("First name can't be blank First name Last name Username Password Password confirmation")
    end

    it "tells last name hasnt been submited" do
      visit new_user_path
      fill_in "user[first_name]", with: "Tracy"
      fill_in "user[last_name]", with: nil
      fill_in "user[username]", with: "ycart"
      fill_in "user[password]", with: "michelle"
      fill_in "user[password_confirmation]", with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content("Last name can't be blank First name Last name Username Password Password confirmation")
    end

    it "tells username hasnt been submited" do
      visit new_user_path
      fill_in "user[first_name]", with: "Tracy"
      fill_in "user[last_name]", with: "Caruso"
      fill_in "user[username]", with: nil
      fill_in "user[password]", with: "michelle"
      fill_in "user[password_confirmation]", with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content("Username can't be blank First name Last name Username Password Password confirmation")
    end

    it "tells if password confirmation doesn't match hasnt been submited" do
      visit new_user_path
      fill_in "user[first_name]", with: "Tracy"
      fill_in "user[last_name]", with: "Caruso"
      fill_in "user[username]", with: "ycart"
      fill_in "user[password]", with: "michelle1"
      fill_in "user[password_confirmation]", with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content("Password confirmation doesn't match Password First name Last name Username Password Password confirmation")
    end
  end






end
