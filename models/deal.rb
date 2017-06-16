require_relative '../db/sql_runner'
require_relative 'flight'

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
end
