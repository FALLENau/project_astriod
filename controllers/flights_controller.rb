require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/flight.rb' #why do I need to require deal and ship?
require_relative '../models/deal.rb'
require_relative '../models/ship.rb'
require_relative '../models/day.rb'

# index
get '/flights' do
  @flights = Flight.all()
  erb(:'flights/index')
end

# add a new deal to a particular flight
get '/flights/new' do
  @ships = Ship.all
  @flights = Flight.all
  erb(:"flights/new")
end

#CREATE
post '/flights' do
  flight = Flight.new(params)
  flight.save()
  redirect to ('/flights')
end
