require_relative '../db/sql_runner'
require 'pry-byebug'

class Day
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO days (
    name
    ) VALUES (
    '#{name}'
    ) RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end



  def self.all()
  sql = "SELECT * FROM days"
  days_hash = SqlRunner.run(sql)
  result = days_hash.map {|day| Day.new(day)}
  return result
  end

  def self.find(id)
  sql = "SELECT * FROM days WHERE id=#{id}"
  day = SqlRunner.run(sql)
  result = Day.new(day.first)
  return result
  end

  def self.delete_all()
  sql = "DELETE FROM days"
  SqlRunner.run(sql)
  end
end
# binding.pry
# nil
