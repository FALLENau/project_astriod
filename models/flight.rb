require_relative '../db/sql_runner'
require_relative 'deal'
require 'pry-byebug'

class Flight
  attr_reader :id, :price, :time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @price = options['price'].to_i
    @time = options['time'].to_i
    @ship_id = options['ship_id'].to_i
  end

  def save
    sql = "INSERT INTO flights (
    price, time, ship_id
    ) VALUES (
    #{price}, #{time}, #{@ship_id}
    ) RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end


  def deal
    sql = "SELECT * FROM deals
    WHERE id = #{@deal_id}"
    deal_hash = SqlRunner.run(sql).first
    return Deal.new(deal_hash)
  end

  def self.all()
    sql = "SELECT * FROM flights"
    flights_hash = SqlRunner.run(sql)
    result = flights_hash.map {|flight| Flight.new(flight)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM flights WHERE id=#{id}"
    flight = SqlRunner.run(sql)
    result = Flight.new(flight.first)

    return result
  end

  def Flight.delete_all()
    sql = "DELETE FROM flights"
    SqlRunner.run(sql)
  end
end

# binding.pry
# nil
