# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tap.create([{name: "Hoppful"}, {name: "Nitro"}, {name: "Hoppless"}])
Beer.create([{guid: "asdf", name: "beer1", description: "a beer"},{guid: "qwer", name: "beer2", description: "another beer"},])
Keg.create([{beer_id: Beer.first.id, tap_id: Tap.first.id}, {beer_id: Beer.last.id, tap_id: Tap.last.id}])
