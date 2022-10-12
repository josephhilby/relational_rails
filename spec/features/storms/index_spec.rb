require 'rails_helper'

RSpec.describe 'On the storms index page' do
  # As a visitor
  # When I visit /storms'
  # Then I see each storm in the system including the storms attributes
  describe 'As a visitor' do
    describe 'When I visit /storms' do
      it 'Then I see each storm in the system including the storms attributes' do
        storm_1 = Storm.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        storm_2 = Storm.create!(storm_type: "Hurricane", landfall: true, wind_spd: 155, name: "Ian")
        visit "/storms"
        save_and_open_page
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