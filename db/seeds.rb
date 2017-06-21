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
wednesday = Day.new({'name' => 'Wednesday'})
thursday = Day.new({'name' => 'Thursday'})
friday = Day.new({'name' => 'Friday'})
saturday = Day.new({'name' => 'Saturday'})
sunday = Day.new({'name' => 'Sunday'})

monday.save()
tuesday.save()
wednesday.save()
thursday.save()
friday.save()
saturday.save()
sunday.save()

ship1 = Ship.new({ 'name' => 'Lynx', 'url' => '/images/1.jpg', 'company' => 'XCOR Aerospace' })
ship2 = Ship.new({ 'name' => 'SpaceShipTwo', 'url' => '/images/2.jpg', 'company' => 'Virgin Galactic'  })
ship3 = Ship.new({ 'name' => 'Armadillo', 'url' => '/images/3.jpg', 'company' => 'Aerospace'  })
ship4 = Ship.new({ 'name' => 'Air-Launched Rocket', 'url' => '/images/4.jpg', 'company' => 'Stratolaunch Systems'  })

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

deal1 = Deal.new({ 'name' => 'Once in a life time', 'flight_id' => flight1.id, 'day_id' => monday.id, 'price_mod' => 0.25 })
deal2 = Deal.new({ 'name' => 'The Grand Tour', 'flight_id' => flight2.id, 'day_id' => wednesday.id, 'price_mod' => 0.30   })
deal3 = Deal.new({ 'name' => 'Historic sites', 'flight_id' => flight3.id, 'day_id' => thursday.id, 'price_mod' => 0.40   })
deal4 = Deal.new({ 'name' => 'Ride the waves', 'flight_id' => flight4.id, 'day_id' => saturday.id, 'price_mod' => 0.15   })

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
