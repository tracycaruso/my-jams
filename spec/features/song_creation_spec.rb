require 'rails_helper'

RSpec.describe 'User creates a song' do
  context 'with valid attributes' do
    it "saves and displays the song title" do
      visit new_song_path
      fill_in "song[title]", with: "My Song"
      fill_in "song[artist]", with: "My Artist"
      click_link_or_button "Create Song"
      expect(page).to have_content('My Song')
    end
  end

end
