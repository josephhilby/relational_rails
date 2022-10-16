require 'rails_helper'

RSpec.describe 'Storms Show Page' do
  describe 'When I visit /storms/:id' do
    describe 'Then I see' do
      it '1) The storm with that id including its attributes' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        storm_1 = season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        storm_2 = season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
        visit "/storms/#{storm_1.id}"

        expect(page).to have_content("#{storm_1.storm_type} #{storm_1.name}")
        expect(page).to have_content("#{storm_1.wind_spd} mph")
        expect(page).to have_content('Hurricane Sam did not make landfall in the US')

        expect(page).to_not have_content("#{storm_2.storm_type} #{storm_2.name}")
        expect(page).to_not have_content(storm_2.wind_spd)
        expect(page).to_not have_content('Hurrican Ian did made landfall in the US')
      end

      it '2) A link to update that storm "Update Storm"' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        storm_1 = season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        visit "/storms/#{storm_1.id}"

        expect(page).to have_content("Update Storm")
      end
    end

    describe 'When I click "Update Storm"' do
      it '1) I am taken to /storms/:id/edit' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        storm_1 = season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        visit "/storms/#{storm_1.id}"
        click_on "Update Storm"

        expect(current_path).to eq("/storms/#{storm_1.id}/edit")
      end
    end
  end
end