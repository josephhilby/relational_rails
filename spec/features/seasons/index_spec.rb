require 'rails_helper'

RSpec.describe 'Seasons Index Page' do
  before(:each) do
    @season_21 = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
    @season_22 = Season.create!(year: 2022, biggest_storm: "Sam", fema_state_emg: false)
  end
  describe 'When I visit /seasons' do
    describe 'Then I see' do
      it '1) The name of each season record in the system' do
        visit "/seasons"

        expect(page).to have_content(@season_21.year)
        expect(page).to have_content(@season_22.year)
      end

      it '2) A link to create a new Seasons record, "New Season"' do
        visit "/seasons"

        expect(page).to have_content("New Season")
      end

      it '3) A link to update a Seasons record, "Update Season"' do
        visit "/seasons"

        expect(page).to have_content("Update 2021 Season")
        expect(page).to have_content("Update #{@season_22.year} Season")
      end
    end

    describe 'When I click "New Season"' do
      it '1) I am taken to /seasons/new' do
        visit "/seasons"
        click_on "New Season"

        expect(current_path).to eq("/seasons/new")
      end
    end

    describe 'When I click "Update Season"' do
      it '1) I am taken to /seasons/edit' do
        visit "/seasons"
        click_on "Update 2022 Season"

        expect(current_path).to eq("/seasons/#{@season_22[:id]}/edit")
      end
    end

    describe 'When I click "Delete Season"' do
      it '1) The season is deleted' do
        visit "/seasons"
        click_on "Delete"

        expect(current_path).to eq("/seasons")
        expect(page).to_not have_content("2021")
      end

      it '2) And all storm records linked to that season' do
        visit "/seasons"
        click_on "Delete"
        visit "/storms"

        expect(page).to_not have_content("#{@storm_ian[:name]}")
        expect(page).to_not have_content("#{@storm_sam[:name]}")
      end
    end
  end
end

