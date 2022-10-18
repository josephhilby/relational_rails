require 'rails_helper'

RSpec.describe 'Storms Update Page' do
  describe 'When I visit /storms/:id/edit' do
    before(:each) do
      season_21 = Season.create!(year: 2021, biggest_storm: "Sam", fema_state_emg: true)
      @storm_sam = season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
    end

    describe 'Then I see' do
      it '1) The name of the storm record' do
        visit "/storms/#{@storm_sam[:id]}/edit"

        expect(page).to have_content("Hurricane Sam")
      end
    end

    describe 'When I fill out the form and click the button "Update Storm"' do
      it '1) I am taken to /storms/:id' do
        visit "/storms/#{@storm_sam[:id]}/edit"
        fill_in "storm[name]", with: "Test Storm"
        fill_in "storm[storm_type]", with: 'A big storm'
        fill_in "storm[wind_spd]", with: 999
        select('No', from: 'storm[landfall]')
        click_on "Update Storm"

        expect(current_path).to eq("/storms/#{@storm_sam[:id]}")
      end

      it '2) And I see the storms updated info' do
        visit "/storms/#{@storm_sam[:id]}/edit"
        fill_in "storm[name]", with: "Test Storm"
        fill_in "storm[storm_type]", with: 'A big storm'
        fill_in "storm[wind_spd]", with: 999
        select('No', from: 'storm[landfall]')
        click_on "Update Storm"

        expect(page).to have_content("Test Storm")
        expect(page).to have_content("A big storm")
      end
    end
  end
end