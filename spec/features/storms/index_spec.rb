require 'rails_helper'

RSpec.describe 'Storms Index Page' do
  describe 'When I visit /storms' do
    before(:each) do
      @season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
      @storm_1 = @season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
      @storm_2 = @season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
      @storm_3 = @season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 180, name: "Andrew")
      visit "/storms"
    end

    describe 'Then I see' do
      it '1) Each storm that made landfall in the system including its attributes' do
        expect(page).to_not have_content(@storm_1[:name])
        expect(page).to_not have_content('Did not make landfall')

        expect(page).to have_content(@storm_2[:name])
        expect(page).to have_content(@storm_2[:storm_type])
        expect(page).to have_content(@storm_2[:wind_spd])
        expect(page).to have_content('Made landfall')

        expect(page).to have_content(@storm_3[:name])
        expect(page).to have_content(@storm_3[:storm_type])
        expect(page).to have_content(@storm_3[:wind_spd])
        expect(page).to have_content('Made landfall')
      end

      it '2) Each storm record ordered by most recently created first (top)' do
        expect("#{@storm_3[:name]}").to appear_before("#{@storm_2[:name]}")
      end

      it '3) I see when each storm was created' do
        expect(page).to have_content("#{@storm_2[:created_at]}")
        expect(page).to have_content("#{@storm_3[:created_at]}")
      end

      it '4) A link to update that season "Update Storm"' do

        expect(page).to have_button("Update Storm")
      end

      it '5) A link to season "Delete Storm"' do

        expect(page).to have_button("Delete Storm")
      end
    end

    describe 'When I click "Update Storm"' do
      it '1) I am taken to /storms/:id/edit' do

        click_on "Update Storm", match: :first

        expect(current_path).to eq("/storms/#{@storm_3[:id]}/edit")
      end
    end

    describe 'When I click "Delete Storm"' do
      it '1) The storm is deleted' do
        visit "/storms"
        click_on "Delete Storm", match: :first

        expect(current_path).to eq("/storms")
        expect(page).to_not have_content("2021")
      end
    end
  end
end