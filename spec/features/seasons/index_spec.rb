require 'rails_helper'

RSpec.describe 'On the seasons index page' do
  # As a visitor
  # When I visit '/seasons'
  # Then I see the name (year) of each season record in the system
  describe 'As a visitor' do
    describe 'When I visit /seasons' do
      it 'Then I see the name of each season record in the system' do
        season_1 = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        season_2 = Season.create!(year: 2022, biggest_storm: "Sam", fema_state_emg: false)
        visit "/seasons"

        expect(page).to have_content(season_1.year)
        expect(page).to have_content(season_2.year)
      end
    end
  end
end
