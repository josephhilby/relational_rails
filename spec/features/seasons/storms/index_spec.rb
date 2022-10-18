require 'rails_helper'

RSpec.describe 'Season_Storms Index Page' do
  before(:each) do
    @season_21 = Season.create!(year: 2021, biggest_storm: "Andrew", fema_state_emg: true)
    @storm_bert = @season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Bert")
    @storm_chris = @season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Chris")
    @storm_andrew = @season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 180, name: "Andrew")
  end
  describe 'When I visit /seasons/:id/storms' do
    describe 'Then I see' do
      it '1) Each storm associated with that season with its attributes' do
        visit "/seasons/#{@season_21[:id]}/storms"

        expect(page).to have_content("All Storms in the #{@season_21[:year]} Hurricane Season")

        expect(page).to have_content(@storm_bert[:name])
        expect(page).to have_content(@storm_bert[:storm_type])
        expect(page).to have_content(@storm_bert[:wind_spd])
        expect(page).to have_content('Did not make landfall')

        expect(page).to have_content(@storm_chris[:name])
        expect(page).to have_content(@storm_chris[:storm_type])
        expect(page).to have_content(@storm_chris[:wind_spd])
        expect(page).to have_content('Made landfall')
      end

      it '2) A link to sort storms alphabeticaly' do
        visit "/seasons/#{@season_21[:id]}/storms"

        click_on "Name"
        expect(@storm_andrew[:name]).to appear_before(@storm_bert[:name])
        expect(@storm_bert[:name]).to appear_before(@storm_chris[:name])
      end

      it '3) A link to add a new storm for that season "Create Storm"' do
        visit "/seasons/#{@season_21[:id]}/storms"

        expect(page).to have_content("Create Storm")
      end

      it '4) A form that allows a selected wind speed' do
        visit "/seasons/#{@season_21[:id]}/storms"

        expect(page).to have_button("Filter")
      end

      it '5) A link to season "Delete Storm"' do
        visit "/seasons/#{@season_21[:id]}/storms"

        expect(page).to have_button("Delete Storm")
      end
    end

    describe 'When I click "Create Storm' do
      it '1) I am taken to /seasons/:id/storms/new' do
        visit "/seasons/#{@season_21[:id]}/storms"
        click_on "Create Storm"

        expect(current_path).to eq("/seasons/#{@season_21[:id]}/storms/new")
      end
    end

    describe 'When I select a windspeed in that form and select "Filter"' do
      it '1) Storms below that windspeed are removed' do
        visit "/seasons/#{@season_21[:id]}/storms"
        fill_in "wind_spd", with: 160
        click_on "Filter"

        expect(page).to have_content(@storm_andrew[:name])
        expect(page).to_not have_content(@storm_bert[:name])
        expect(page).to_not have_content(@storm_chris[:name])
      end
    end

    describe 'When I click "Delete Storm"' do
      it '1) The storm is deleted' do
        visit "/seasons/#{@season_21[:id]}/storms"
        click_on "Delete Storm", match: :first

        expect(current_path).to eq("/storms")
        expect(page).to_not have_content("Bert")
      end
    end
  end
end