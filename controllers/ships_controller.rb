require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/flight.rb' #why do I need to require flight and deal?
require_relative '../models/deal.rb'
require_relative '../models/ship.rb'
require_relative '../models/day.rb'

# index
get '/ships' do
  @ships = Ship.all()
  erb(:'ships/index')
end
