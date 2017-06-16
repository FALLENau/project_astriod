require 'pry-byebug'
require_relative '../models/deal'
require_relative '../models/flight'
require_relative '../models/ship'

ship1 = Ship.new({ 'name' => 'name here', 'url' => 'http' })
ship2 = Ship.new({ 'name' => 'name here', 'url' => 'http' })
ship3 = Ship.new({ 'name' => 'name here', 'url' => 'http' })
ship4 = Ship.new({ 'name' => 'name here', 'url' => 'http' })

ship1.save()
ship2.save()
ship3.save()
ship4.save()

flight1 = Flight.new({ 'price' => 12000, 'time' => 18.00 })
flight2 = Flight.new({ 'price' => 20000, 'time' => 10.00 })
flight3 = Flight.new({ 'price' => 18000, 'time' => 14.00 })
flight4 = Flight.new({ 'price' => 15000, 'time' => 16.00 })

flight1.save()
flight2.save()
flight3.save()
flight4.save()

deal1 = Deal.new({ 'name' => 'Once in a life time'})
deal2 = Deal.new({ 'name' => 'The Grand Tour'})
deal3 = Deal.new({ 'name' => 'Historic sites'})
deal4 = Deal.new({ 'name' => 'Ride the waves'})

deal1.save()
deal2.save()
deal3.save()
deal4.save()

binding.pry
nil
