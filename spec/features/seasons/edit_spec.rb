require 'rails_helper'

RSpec.describe 'Seasons Update Page' do
  describe 'When I visit /seasons/:id/edit' do
    before(:each) do
      @season_22 = Season.create!(year: 2022, biggest_storm: "Ian", fema_state_emg: true)
      @season_21 = Season.create!(year: 2021, biggest_storm: "Sam", fema_state_emg: true)
      @season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
      @season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
    end

    describe 'Then I see' do
      it '1) The name of the season record' do
        visit "/seasons/#{@season_22.id}/edit"

        expect(page).to have_content("2022")
      end
    end

    describe 'When I fill out the form click the button "Update Season"' do
      it '1) I am taken to /seasons' do
        visit "/seasons/#{@season_22.id}/edit"
        fill_in "season[year]", with: 2099
        fill_in "season[biggest_storm]", with: 'A big storm'
        select('No', from: 'season[fema_state_emg]')
        click_on "Update Season"

        expect(page).to have_content("2099")
      end
    end
  end
end