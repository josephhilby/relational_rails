require 'rails_helper'

RSpec.describe Storm, type: :model do
  it { should belong_to :season }
  before(:each) do
    @season_21 = Season.create!(year: 2021, biggest_storm: "Andrew", fema_state_emg: true)
    @storm_bert = @season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Bert")
    @storm_chris = @season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 150, name: "Chris")
    @storm_andrew = @season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 180, name: "Andrew")
  end
  describe 'In Storm Model' do
    describe '#self.filter_by_wind_spd(wind)' do
      it 'Remove storms at or below given value' do
        expect(@season_21.storms.filter_by_wind_spd(160)).to eq([@storm_andrew])
        expect(@season_21.storms.filter_by_wind_spd(154)).to eq([@storm_bert, @storm_andrew])
      end
    end
  end
end