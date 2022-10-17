require 'rails_helper'

RSpec.describe 'Seasons Show Page' do
  before(:each) do
      @season_22 = Season.create!(year: 2022, biggest_storm: "Ian", fema_state_emg: true)
      @season_21 = Season.create!(year: 2021, biggest_storm: "Sam", fema_state_emg: true)
      @storm_andrew = @season_22.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 180, name: "Andrew")

      @storm_sam = @season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
      @storm_ian = @season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
    end
  describe 'When I visit /seasons/:id' do
    describe 'Then I see' do
      it '1) The season with that id including its attributes' do
        visit "/seasons/#{@season_22.id}"

        expect(page).to have_content(@season_22.year)
        expect(page).to have_content(@season_22.biggest_storm)
        expect(page).to have_content('FEMA declared')
        expect(page).to_not have_content(@season_21.year)
        expect(page).to_not have_content(@season_21.biggest_storm)
        expect(page).to_not have_content('FEMA did not declare')
      end

      it '2) A count of the number of storms associated with this season' do
        visit "/seasons/#{@season_21.id}"

        expect(page).to have_content("There were #{@season_21.storms.count} storms that year.")
      end

      it '3) A link to take me to that seasons /season/:id/storms' do
        visit "/seasons/#{@season_21.id}"
        click_on "Storms"

        expect(current_path).to eq("/seasons/#{@season_21.id}/storms")
      end

      it '4) A link to update that season "Update Season"' do
        visit "/seasons/#{@season_22.id}"

        expect(page).to have_content("Update Season")
      end

      it '5) A link to season "Delete Season"' do
        visit "/seasons/#{@season_21.id}"

        expect(page).to have_button("Delete")
      end
    end

    describe 'When I click "Update Season"' do
      it '1) I am taken to /seasons/:id/edit' do
        visit "/seasons/#{@season_21.id}"
        click_on "Update Season"

        expect(current_path).to eq("/seasons/#{@season_21.id}/edit")
      end
    end

    describe 'When I click "Delete Season"' do
      it '1) The season is deleted' do
        visit "/seasons/#{@season_21.id}"
        click_on "Delete"

        expect(current_path).to eq("/seasons")
        expect(page).to_not have_content("2021")
      end

      it '2) And all storm records linked to that season' do
        visit "/seasons/#{@season_21.id}"
        click_on "Delete"
        visit "/storms"

        expect(page).to_not have_content("#{@storm_ian[:name]}")
        expect(page).to_not have_content("#{@storm_sam[:name]}")
      end

      it 'test' do
        visit "/seasons"
        save_and_open_page
        visit "/storms"
        save_and_open_page
      end
    end
  end
end