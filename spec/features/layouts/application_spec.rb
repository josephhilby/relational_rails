require 'rails_helper'

RSpec.describe 'All Pages' do
  before(:all) do
    @season_21 = Season.create!(year: 2021, biggest_storm: "Sam", fema_state_emg: true)
    @storm_sam = @season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
  end
  describe 'When I visit:' do
    it '1) "/" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")

      click_on "Seasons List"
      expect(current_path).to eq("/seasons")
    end

    it '2) "/seasons" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/seasons"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
      click_on "Storms List"
      expect(current_path).to eq("/storms")
    end

    it '3) "/seasons/new" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/seasons/new"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end

    it '4) "/seasons/:id" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/seasons/#{@season_21[:id]}"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end

    it '5) "/seasons/:id/edit" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/seasons/#{@season_21[:id]}/edit"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end

    it '6) "/seasons/:id/storms" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/seasons/#{@season_21[:id]}/storms"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end

    it '7) "/seasons/:id/storms/new" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/seasons/#{@season_21[:id]}/storms/new"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end

    it '8) "/storms" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/storms"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end

    it '9) "/storms/:id" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/storms/#{@storm_sam[:id]}"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end

    it '10) "/storms/:id/edit" then I see an unordered list of links for Home, Seasons, and Storms' do
      visit "/storms/#{@storm_sam[:id]}/edit"

      expect(page).to have_content("Seasons List")
      expect(page).to have_content("Storms List")
    end
  end
end