require 'rails_helper'

RSpec.describe 'Storms Show Page' do
  before(:each) do
    @season_21 = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
    @storm_sam = @season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
    @storm_ian = @season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
  end
  describe 'When I visit /storms/:id' do
    describe 'Then I see' do
      it '1) The storm with that id including its attributes' do
        visit "/storms/#{@storm_sam[:id]}"

        expect(page).to have_content("#{@storm_sam[:storm_type]} #{@storm_sam[:name]}")
        expect(page).to have_content("#{@storm_sam[:wind_spd]} mph")
        expect(page).to have_content('Hurricane Sam did not make landfall in the US')

        expect(page).to_not have_content("#{@storm_ian[:storm_type]} #{@storm_ian[:name]}")
        expect(page).to_not have_content(@storm_ian[:wind_spd])
        expect(page).to_not have_content('Hurrican Ian did made landfall in the US')
      end

      it '2) A link to update that storm "Update Storm"' do
        visit "/storms/#{@storm_sam[:id]}"

        expect(page).to have_content("Update Storm")
      end

      it '3) A link to delete the storm "Delete Storm"' do
        visit "/storms/#{@storm_sam[:id]}"

        expect(page).to have_button("Delete Storm")
        click_on "Delete Storm"
      end
    end

    describe 'When I click "Update Storm"' do
      it '1) I am taken to /storms/:id/edit' do
        visit "/storms/#{@storm_sam[:id]}"
        click_on "Update Storm"

        expect(current_path).to eq("/storms/#{@storm_sam[:id]}/edit")
      end
    end

    describe 'When I click "Delete Storm"' do
      it '1) I am taken to /storms' do
        visit "/storms/#{@storm_sam[:id]}"
        click_on "Delete Storm"

        expect(current_path).to eq("/storms")
      end
      it '2) I no longer see the deleted storm' do
        visit "/storms/#{@storm_sam[:id]}"
        click_on "Delete Storm"

        expect(page).to_not have_content("Sam")
      end
    end
  end
end