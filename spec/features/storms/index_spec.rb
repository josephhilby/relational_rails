require 'rails_helper'

RSpec.describe 'Storms Index Page' do
  describe 'When I visit /storms' do
    before(:each) do
      @season = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
      @storm_1 = @season.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
      @storm_2 = @season.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
      visit "/storms"
    end

    describe 'Then I see' do
      it '1) Each storm in the system including its attributes' do
        expect(page).to have_content(@storm_1.name)
        expect(page).to have_content(@storm_1.storm_type)
        expect(page).to have_content(@storm_1.wind_spd)
        expect(page).to have_content('Sam did not make landfall')

        expect(page).to have_content(@storm_2.name)
        expect(page).to have_content(@storm_2.storm_type)
        expect(page).to have_content(@storm_2.wind_spd)
        expect(page).to have_content('Ian made landfall')
      end

      it '2) Each storm record ordered by most recently created first (top)' do
        expect("Hurricane #{@storm_2.name}").to appear_before("Hurricane #{@storm_1.name}")
      end

      it '3) I see when each storm was created' do
        expect(page).to have_content("#{@storm_1.created_at}")
        expect(page).to have_content("#{@storm_2.created_at}")
      end
    end
  end
end