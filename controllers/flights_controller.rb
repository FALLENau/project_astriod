require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/flight.rb' #why do I need to require deal and ship?
require_relative '../models/deal.rb'
require_relative '../models/ship.rb'
require_relative '../models/day.rb'

# index
get '/flights' do
  @flight = Flight.all()
  erb(:'flights/index')
end
#
# # show
# '/flights/:id'
#
# # show deals for particular flight
# `/flights/:id/deals`
#
# # add a new deal to a particular flight
# '/flights/:id/deals/new'
#
#
# #NEW = gets info from making new deal for admin
# get "/new" do
#   @days = Day.all
#   @ships = Ship.all
#   @flights = Flight.all
#   erb(:"deals/new")
# end
#
# #CREATE = create new deal by admin
# post "/deal" do
#   Deal.new(params).save()
#   redirect to('/')
# end
