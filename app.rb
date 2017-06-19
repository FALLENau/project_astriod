require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/deals_controller.rb'
require_relative 'controllers/flights_controller.rb'
require_relative 'controllers/ships_controller.rb'

get '/' do
  erb(:index)
end #note: all controllers runner through app, this is based on the many_to_many_sinatra_zombies.
