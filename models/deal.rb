require_relative '../db/sql_runner'
require_relative 'flight'
require_relative 'day'
require_relative 'ship'
require 'pry-byebug'

class Deal
  attr_reader :id, :name, :day_id, :price_mod

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @day_id = options['day_id'].to_i
    @price_mod = options['price_mod'].to_f
  end

  def save
    sql = "INSERT INTO deals (
    name, day_id, price_mod
    ) VALUES (
    '#{@name}', #{@day_id}, #{@price_mod}
    ) RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM deals WHERE id=#{id};"
    deal = SqlRunner.run( sql )
    result = Deal.new( deal.first )
    return result
  end


  def self.all_details(id)
    sql = "SELECT * FROM ships
    INNER JOIN flights
    ON ships.id = flights.ship_id
    INNER JOIN flight_deals
    ON flight_deals.flight_id = flights.id
    WHERE flight_deals.deal_id = #{id}"
    trip_array = SqlRunner.run(sql).map do |trip|
      {
      ship: Ship.new(trip),
      flight: Flight.new(trip)
    }
    end
    return trip_array
  end

  def day
    sql = "SELECT * FROM days
    WHERE id = #{@day_id}"
    day_hash = SqlRunner.run(sql).first
    return Day.new(day_hash)

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
