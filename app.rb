require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/deals_controller.rb'
require_relative 'controllers/flights_controller.rb'
require_relative 'controllers/ships_controller.rb'
require_relative 'controllers/flight_deals_controller.rb'

get '/' do
  @deals = Deal.all()
  erb(:"deals/index")
end #note: all controllers runner through app, this is based on the many_to_many_sinatra_zombies.

get '/admin' do
  erb(:"admin/admin")
end
