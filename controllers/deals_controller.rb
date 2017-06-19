require 'sinatra'
require 'sinatra/contrib/all'
# require 'pry-byebug'
require_relative '../models/deal.rb'
require_relative '../models/flight.rb'
require_relative '../models/ship.rb'
require_relative '../models/day.rb'

#INDEX = get '/deals_ect'
get "/" do
  @deals = Deal.all()
  erb(:"deals/index")
end
