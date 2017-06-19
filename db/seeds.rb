require 'pry-byebug'
require_relative '../models/deal'
require_relative '../models/flight'
require_relative '../models/ship'
require_relative '../models/day'
require_relative '../models/flight_deal'

FlightDeal.delete_all()
Flight.delete_all()
Deal.delete_all()
Ship.delete_all()
Day.delete_all()

monday = Day.new({'name' => 'Monday'})
tuesday = Day.new({'name' => 'Tuesday'})
day3 = Day.new({'name' => 'Wednesday'})
day4 = Day.new({'name' => 'Thursday'})
day5 = Day.new({'name' => 'Friday'})
day6 = Day.new({'name' => 'Saturday'})
day7 = Day.new({'name' => 'Sunday'})

monday.save()
tuesday.save()
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

flight1 = Flight.new({ 'price' => 12000, 'time' => 1800, 'ship_id' => ship1.id })
flight2 = Flight.new({ 'price' => 20000, 'time' => 1000, 'ship_id' => ship2.id })
flight3 = Flight.new({ 'price' => 18000, 'time' => 1400, 'ship_id' => ship3.id })
flight4 = Flight.new({ 'price' => 15000, 'time' => 1600, 'ship_id' => ship4.id })

flight1.save()
flight2.save()
flight3.save()
flight4.save()

deal1 = Deal.new({ 'name' => 'Once in a life time', 'flight_id' => flight1.id, 'day_id' => monday.id })
deal2 = Deal.new({ 'name' => 'The Grand Tour', 'flight_id' => flight2.id, 'day_id' => day3.id  })
deal3 = Deal.new({ 'name' => 'Historic sites', 'flight_id' => flight3.id, 'day_id' => day4.id  })
deal4 = Deal.new({ 'name' => 'Ride the waves', 'flight_id' => flight4.id, 'day_id' => day6.id  })

deal1.save()
deal2.save()
deal3.save()
deal4.save()

flight_deal1 = FlightDeal.new({ 'flight_id' => flight1.id, 'deal_id' => deal1.id })
flight_deal2 = FlightDeal.new({ 'flight_id' => flight2.id, 'deal_id' => deal2.id })
flight_deal3 = FlightDeal.new({ 'flight_id' => flight3.id, 'deal_id' => deal3.id })
flight_deal4 = FlightDeal.new({ 'flight_id' => flight4.id, 'deal_id' => deal4.id })
flight_deal1.save()
flight_deal2.save()
flight_deal3.save()
flight_deal4.save()

# binding.pry
# nil
