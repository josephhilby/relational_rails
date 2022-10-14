# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

season_21 = Season.create!(year: 2021, biggest_storm: "Ian", fema_state_emg: true)
season_21.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 155, name: "Sam")
season_21.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 154, name: "Ian")

season_20 = Season.create!(year: 2020, biggest_storm: "Sally", fema_state_emg: false)
season_20.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 110, name: "Sally")
season_20.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 140, name: "Delta")
season_20.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 150, name: "Laura")
season_20.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 90, name: "Hanna")
season_20.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 150, name: "Eta")

season_19 = Season.create!(year: 2019, biggest_storm: "Dorian", fema_state_emg: false)
season_19.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 185, name: "Dorian")
season_19.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 75, name: "Barry")

season_18 = Season.create!(year: 2018, biggest_storm: "Michael", fema_state_emg: true)
season_18.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 160, name: "Michael")
season_18.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 150, name: "Florence")
season_18.storms.create!(storm_type: "Hurricane", landfall: true, wind_spd: 70, name: "Gordon")

season_17 = Season.create!(year: 2017, biggest_storm: "Irma", fema_state_emg: true)
season_17.storms.create!(storm_type: "Hurricane", landfall: false, wind_spd: 180, name: "Irma")