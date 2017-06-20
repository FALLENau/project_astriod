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

# #NEW = gets info from making new deal for admin
# get "/new" do
#   @deals = Deal.all
#   erb(:new)
# end
#
# #CREATE = create new deal by admin
# post "/newdeal" do
#   Deal.new(params).save()
#   erb(:create)
# end
