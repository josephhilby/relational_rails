require 'rails_helper'

RSpec.describe 'Season_Storms Index Page' do
  describe 'When I visit /seasons/:id/storms' do
    describe 'Then I see' do
      it '1) Each storm associated with that season with its attributes' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        storm_1 = season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        storm_2 = season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
        visit "/seasons/#{season.id}/storms"
        save_and_open_page
        expect(page).to have_content("All Storms in the #{season.year} Hurricane Season")

        expect(page).to have_content(storm_1.name)
        expect(page).to have_content(storm_1.storm_type)
        expect(page).to have_content(storm_1.wind_spd)
        expect(page).to have_content('Did not make landfall')

        expect(page).to have_content(storm_2.name)
        expect(page).to have_content(storm_2.storm_type)
        expect(page).to have_content(storm_2.wind_spd)
        expect(page).to have_content('Made landfall')
      end

      it '2) A link to sort storms alphabeticaly' do
        season = Season.create!(year: 2021, biggest_storm: "Andrew", fema_state_emg: true)
        storm_1 = season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Bert")
        storm_2 = season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Chris")
        storm_3 = season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 180, name: "Andrew")
        visit "/seasons/#{season.id}/storms"

        click_on "Name"
        expect(storm_3.name).to appear_before(storm_1.name)
        expect(storm_1.name).to appear_before(storm_2.name)
      end

      it '3) A link to add a new storm for that season "Create Storm"' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        visit "/seasons/#{season.id}/storms"

        expect(page).to have_content("Create Storm")
      end
    end

    describe 'When I click "Create Storm' do
      it '1) I am taken to /seasons/:id/storms/new' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        visit "/seasons/#{season.id}/storms"
        click_on "Create Storm"

        expect(current_path).to eq("/seasons/#{season.id}/storms/new")
      end
    end
  end
end