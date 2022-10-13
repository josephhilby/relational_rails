class CreateStorm < ActiveRecord::Migration[5.2]
  def change
    create_table :storms do |t|
      t.string :storm_type
      t.boolean :landfall
      t.integer :wind_spd
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
