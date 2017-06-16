require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/deal.rb'
require_relative '../models/flight.rb' #why do I need to require deal and ship?
require_relative '../models/ship.rb'
