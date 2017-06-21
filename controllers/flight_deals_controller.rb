require 'sinatra'
require 'sinatra/contrib/all'
# require 'pry-byebug'
require_relative '../models/deal.rb'
require_relative '../models/flight.rb'
require_relative '../models/ship.rb'
require_relative '../models/day.rb'
require_relative '../models/flight_deal.rb'

#INDEX = get '/deals_ect'
get "/flight_deals" do
  @deals = Deal.all()
  #@trip_array = Deal.all_details
  erb(:"deals/index")
end



#NEW = gets info from making new deal for admin
get "/flight_deals/new" do
  @deals = Deal.all
  @flights = Flight.all
  erb(:"flight_deals/new")
end

#CREATE
post "/flight_deals" do
  FlightDeal.new(params).save()
  redirect to "/flight_deals"
end
