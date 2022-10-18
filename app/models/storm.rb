class Storm < ApplicationRecord
  belongs_to :season

  def self.filter_by_wind_spd(wind)
    self.where("wind_spd > #{wind}")
  end
end