require 'rails_helper'

RSpec.describe 'On the seasons storms index page' do
# As a visitor
# When I visit /seasons/:id/storms
# Then I see each storm that is associated with that season with each storms attributes
  describe 'As a visitor' do
    describe 'When I visit /seasons/:id/storms' do
      it 'Then I see each storm that is associated with that season with each storms attributes' do
        season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        storm_1 = season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        storm_2 = season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
        visit "/seasons/#{season.id}/storms"

        expect(page).to have_content("All Storms in the #{season.year} Hurricane Season")
        expect(page).to have_content(storm_1.name)
        expect(page).to have_content(storm_1.storm_type)
        expect(page).to have_content(storm_1.wind_spd)
        expect(page).to have_content('Sam did not make landfall')
        expect(page).to have_content(storm_2.name)
        expect(page).to have_content(storm_2.storm_type)
        expect(page).to have_content(storm_2.wind_spd)
        expect(page).to have_content('Ian made landfall')
      end
    end
  end
end