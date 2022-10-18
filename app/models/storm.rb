class Storm < ApplicationRecord
  belongs_to :season

  def filter_by_wind_spd(storms_array, wind)
    storms_array.find_all { |storm| storm[:wind_spd] > wind }
  end
end