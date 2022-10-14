require 'rails_helper'

RSpec.describe 'Seasons New Page' do
  describe 'When I visit /seasons/new' do
    describe 'Then I see' do
        it '1) Input sections to create a new season' do
          visit "/seasons/new"

          expect(page).to have_content("Year")
          expect(page).to have_content("Biggest named storm")
          expect(page).to have_content("Was a FEMA State of Emergency declared")
        end
    end

    describe 'When I fill out the form click the button "Create Season"' do
      it '1) I am taken to /seasons' do
        visit "/seasons/new"
        click_on "Create Season"

        expect(current_path).to eq("/seasons")
      end

      it '2) A new season record is created' do
        visit "/seasons/new"
        fill_in "season[year]", with: 2010
        fill_in "season[biggest_storm]", with: 'A big storm'
        select('No', from: 'season[fema_state_emg]')
        click_on "Create Season"

        expect(page).to have_content("2010")
      end
    end
  end
end