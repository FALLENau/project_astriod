require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/deal.rb'
require_relative '../models/flight.rb'
require_relative '../models/ship.rb'
require_relative '../models/day.rb'

#INDEX = get '/deals_ect'
get "/" do
  @deals = Deal.all()
  erb(:"deals/index")
end

# SHOW
get '/deals/:id' do
  @deal = Deal.find(params["id"].to_i())
  erb(:"deals/show")
end

#NEW = gets info from making new deal for admin
get "/deals/new" do
  @deals = Deal.all
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
