require 'pry-byebug'
require_relative '../models/deal'
require_relative '../models/flight'
require_relative '../models/ship'
require_relative '../models/day'
require_relative '../models/flight_deal'

# Day.delete_all()
# Ship.delete_all()
# Flight.delete_all()
# Deal.delete_all()

day1 = Day.new({'name' => 'Monday'})
day2 = Day.new({'name' => 'Tuesday'})
day3 = Day.new({'name' => 'Wednesday'})
day4 = Day.new({'name' => 'Thursday'})
day5 = Day.new({'name' => 'Friday'})
day6 = Day.new({'name' => 'Saturday'})
day7 = Day.new({'name' => 'Sunday'})

day1.save()
day2.save()
day3.save()
day4.save()
day5.save()
day6.save()
day7.save()

ship1 = Ship.new({ 'name' => 'Lynx', 'url' => 'http', 'company' => 'XCOR Aerospace' })
ship2 = Ship.new({ 'name' => 'SpaceShipTwo', 'url' => 'http', 'company' => 'Virgin Galactic'  })
ship3 = Ship.new({ 'name' => 'Armadillo', 'url' => 'http', 'company' => 'Aerospace'  })
ship4 = Ship.new({ 'name' => 'Air-Launched Rocket', 'url' => 'http', 'company' => 'Stratolaunch Systems'  })

ship1.save()
ship2.save()
ship3.save()
ship4.save()

flight1 = Flight.new({ 'price' => 12000, 'time' => 18.00, 'ship_id' => ship1.id })
# flight2 = Flight.new({ 'price' => 20000, 'time' => 10.00 })
# flight3 = Flight.new({ 'price' => 18000, 'time' => 14.00 })
# flight4 = Flight.new({ 'price' => 15000, 'time' => 16.00 })

flight1.save()
# flight2.save()
# flight3.save()
# flight4.save()

deal1 = Deal.new({ 'name' => 'Once in a life time', 'flight_id' => flight1.id })
# deal2 = Deal.new({ 'name' => 'The Grand Tour'})
# deal3 = Deal.new({ 'name' => 'Historic sites'})
# deal4 = Deal.new({ 'name' => 'Ride the waves'})

deal1.save()
# deal2.save()
# deal3.save()
# deal4.save()

flight_deal1 = FlightDeal.new({ 'flight_id' => flight1.id, 'deal_id' => deal1.id })
flight_deal1.save()

binding.pry
nil
