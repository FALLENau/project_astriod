require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/deal.rb'
require_relative '../models/flight.rb' #why do I need to require flight and ship?
require_relative '../models/ship.rb'

#INDEX = get '/deals_ect'
get "/" do
  @deals = Deal.all()
  erb(:index)
end

#NEW = get form to apply user to deal + price_mod
get "/new" do
  @ship = Ship.all()
  erb(:new)
end #have to reteive data from deal to auto fill some of form.


#CREATE = post form of data to save new user + deal + flight/ship.
post "/" do
  Ship.new(params).save()
  #binding.pry
  erb(:create)
end
