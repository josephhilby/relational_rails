class AddSeasonToStorms < ActiveRecord::Migration[5.2]
  def change
    add_reference :storms, :season, foreign_key: true
  end
end
