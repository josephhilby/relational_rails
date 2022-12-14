# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_13_135922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.string "biggest_storm"
    t.boolean "fema_state_emg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storms", force: :cascade do |t|
    t.string "storm_type"
    t.boolean "landfall"
    t.integer "wind_spd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.bigint "season_id"
    t.index ["season_id"], name: "index_storms_on_season_id"
  end

  add_foreign_key "storms", "seasons"
end
