class CreateSeason < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :year
      t.string :biggest_storm
      t.boolean :fema_state_emg
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
