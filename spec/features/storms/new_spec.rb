require 'rails_helper'

RSpec.describe 'Storms New Page' do
  describe 'When I visit /storms/new' do
    before(:each) do
    end
    describe 'Then I see' do
      it '1)'
      it '2) A "Create Season" button'
    end

    describe 'When I fill out the form click the button "Create Season"' do
      it '1) A POST request is sent to /seasons'
      it '2) I am taken to /seasons'
    end
  end
end