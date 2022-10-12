require 'rails_helper'

RSpec.describe 'On the index page' do
  # As a visitor
  # When I visit /storms'
  # Then I see each storm in the system including the storms attributes
  describe 'As a visitor' do
    describe 'When I visit /storms' do
      it 'Then I see each storm in the system including the storms attributes' do
        storm_1 = Storm.create!()
        storm_2 = Storm.create!()
        visit "/storms"
        save_and_open_page
        expect(page).to have_content()
        expect(page).to have_content()
      end
    end
  end
end