require 'rails_helper'

RSpec.describe 'On the storms show page' do
# As a visitor
# When I visit /storms/:id
# Then I see the storm with that id including the storms attributesattributes
  describe 'As a visitor' do
    describe 'When I visit /storms/:id' do
      it 'Then I see the storm with that id including the storms attributesattributes' do
        storm_1 = Storm.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        storm_2 = Storm.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
        visit "/storms/#{storm_1.id}"
        save_and_open_page

        expect(page).to have_content("#{storm_1.storm_type} #{storm_1.name}")
        expect(page).to have_content("#{storm_1.wind_spd} mph")
        expect(page).to have_content('Hurricane Sam did not make landfall in the US')
        expect(page).to_not have_content("#{storm_2.storm_type} #{storm_2.name}")
        expect(page).to_not have_content(storm_2.wind_spd)
        expect(page).to_not have_content('Hurrican Ian did made landfall in the US')
      end
    end
  end
end