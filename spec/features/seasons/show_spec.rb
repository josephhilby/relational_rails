require 'rails_helper'

RSpec.describe 'On the seasons show page' do
# As a visitor
# When I visit /seasons/:id
# Then I see the parent with that id including the seasons attributes
  describe 'As a visitor' do
    describe 'When I visit /seasons/:id' do
      it 'Then I see the season with that id including the seasons attributes' do
        season_1 = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        season_2 = Season.create!(year: 2022, biggest_storm: "Sam", fema_state_emg: false)
        visit "/seasons/#{season_1.id}"

        expect(page).to have_content(season_1.year)
        expect(page).to have_content(season_1.biggest_storm)
        expect(page).to have_content('FEMA declared')
        expect(page).to_not have_content(season_2.year)
        expect(page).to_not have_content(season_2.biggest_storm)
        expect(page).to_not have_content('FEMA did not declare')
      end
    end
  end
end