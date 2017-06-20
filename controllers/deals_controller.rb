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
  @trip_array = Deal.all_details
  erb(:"deals/index")
end


#NEW = gets info from making new deal for admin
get "/new" do
  @days = Day.all
  @ships = Ship.all
  @flights = Flight.all
  erb(:"deals/new")
end

#CREATE = create new deal by admin
post "/deal" do
  Deal.new(params).save()
  redirect to('/')
end
