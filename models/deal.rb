require_relative '../db/sql_runner'
require_relative 'flight'
require_relative 'day'
require 'pry-byebug'

class Deal
  attr_reader :name#, :day_id, :price_mod

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    #@day_id = options['day_id'].to_i
    #@price_mod = options['price_mod'].to_i
  end

  def save
    sql = "INSERT INTO deals (
    name
    ) VALUES (
    '#{name}'
    ) RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end


  def flight
    sql = "SELECT * FROM flights
    WHERE id = #{@flight_id}"
    flight_hash = SqlRunner.run(sql).first
    return Flight.new(flight_hash)
  end

  def self.all()
    sql = "SELECT * FROM deals"
    deals_hash = SqlRunner.run(sql)
    result = deals_hash.map {|deal| Deal.new(deal)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM deals WHERE id=#{id}"
    deal = SqlRunner.run(sql)
    result = Deal.new(deal.first)
    return result
  end

  def Deal.delete_all()
    sql = "DELETE FROM deals"
    SqlRunner.run(sql)
  end
end

# binding.pry
# nil
