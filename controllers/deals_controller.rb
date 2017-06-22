require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/deal.rb'
require_relative '../models/flight.rb'
require_relative '../models/ship.rb'
require_relative '../models/day.rb'
require_relative '../models/flight_deal'

#INDEX = get '/deals_ect'
get "/" do
  @deals = Deal.all()
  erb(:"deals/index")
end

#NEW = gets info from making new deal for admin
get "/deals/new" do
  @deals = Deal.all
  @days = Day.all
  @ships = Ship.all
  erb(:"deals/new")
end

# SHOW works great
get '/deals/:id' do
  @deal = Deal.find(params["id"].to_i())
  erb(:"deals/show")
end


#CREATE = create new deal by admin
post "/deals" do #note: changed /deal to /deals
  Deal.new(params).save()
  redirect to('/')
end
