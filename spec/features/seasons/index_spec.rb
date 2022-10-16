require 'rails_helper'

RSpec.describe 'Seasons Index Page' do
  before(:each) do
    @season_1 = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
    @season_2 = Season.create!(year: 2022, biggest_storm: "Sam", fema_state_emg: false)
  end
  describe 'When I visit /seasons' do
    describe 'Then I see' do
      it '1) The name of each season record in the system' do
        visit "/seasons"

        expect(page).to have_content(@season_1.year)
        expect(page).to have_content(@season_2.year)
      end

      it '2) A link to create a new Seasons record, "New Season"' do
        visit "/seasons"

        expect(page).to have_content("New Season")
      end

      it '3) A link to update a Seasons record, "Update Season"' do
        visit "/seasons"

        expect(page).to have_content("Update 2021 Season")
        expect(page).to have_content("Update #{@season_2.year} Season")
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
        click_on "Update 2021 Season"

        expect(current_path).to eq("/seasons/#{@season_2[:id]}/edit")
      end
    end
  end
end

