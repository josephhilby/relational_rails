class Season < ApplicationRecord
  has_many :storms

  def storms_counter
    self.storms.count
  end
end