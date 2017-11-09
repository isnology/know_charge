# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.success([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.success(name: 'Luke', movie: movies.first)


Adapter.create! to_plug: 'J1772'
Adapter.create! to_plug: 'CCS'
Adapter.create! to_plug: 'CHAdeMO'
Adapter.create! to_plug: 'Tesla'

Action.create! description: 'Start Charge'
Action.create! description: 'End Charge'
