require 'rails_helper'

RSpec.describe 'Seasons Storms New Page' do
  describe 'When I visit /seasons/:id/storms/new' do
    describe 'Then I see' do
      it '1) Input sections to create a new season' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        visit "/seasons/#{season.id}/storms/new"

        expect(page).to have_content("Storm Name")
        expect(page).to have_content("Storm Type")
        expect(page).to have_content("Storm Wind Speed")
        expect(page).to have_content("Did the storm make landfall in the US?")
      end

      it '2) A "Create Storms" button' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        visit "/seasons/#{season.id}/storms/new"

        expect(page).to have_button("Create Storm")
      end
    end

    describe 'When I fill out the form click the button "Create Storm"' do
      it '1) I am taken to /seasons/:id/storms' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        visit "/seasons/#{season.id}/storms/new"
        fill_in "storm[name]", with: "Test"
        fill_in "storm[storm_type]", with: 'Test Storm'
        fill_in "storm[wind_spd]", with: 999
        select('No', from: 'storm[landfall]')

        click_on "Create Storm"

        expect(current_path).to eq("/seasons/#{season.id}/storms")
      end

      it '2) A new storm record is created' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        visit "/seasons/#{season.id}/storms/new"
        fill_in "storm[name]", with: "Test"
        fill_in "storm[storm_type]", with: 'Test Storm'
        fill_in "storm[wind_spd]", with: 999
        select('No', from: 'storm[landfall]')
        click_on "Create Storm"

        expect(page).to have_content("Test")
        expect(page).to have_content("Test Storm")
        expect(page).to have_content("999")
        expect(page).to have_content("not make landfall")
      end
    end
  end
end