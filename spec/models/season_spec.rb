require 'rails_helper'

RSpec.describe Season, type: :model do
  it { should have_many :storms }

  describe 'In Season Model' do
     describe '#storms_counter' do
      it 'Will count the number of storms' do
        season_21 = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
        season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
        season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")
        season_17 = Season.create!(year: 2017, biggest_storm: "Irma", fema_state_emg: true)
        season_17.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 180, name: "Irma")

        expect(season_21.storms_counter).to eq(2)
        expect(season_17.storms_counter).to eq(1)
      end
    end
  end
end