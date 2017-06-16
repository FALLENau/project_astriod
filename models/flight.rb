require_relative '../db/sql_runner'
require_relative 'deal'
require 'pry-byebug'

class Flight
  attr_reader :price, :time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @price = options['price'].to_i
    @time = options['time'].to_i
  end

  def save
    sql = "INSERT INTO flights (
    price, time
    ) VALUES (
    #{price}, #{time}
    ) RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end
end

# binding.pry
# nil
