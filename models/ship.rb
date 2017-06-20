require_relative '../db/sql_runner'
# require_relative 'flight'
require 'pry-byebug'

class Ship
  attr_reader :id, :name, :url, :company

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @url = options['url']
    @company = options['company']
  end

  def save
    sql = "INSERT INTO ships (
    name, url, company
    ) VALUES (
    '#{name}', '#{url}', '#{company}'
    ) RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM ships"
    ships_hash = SqlRunner.run(sql)
    result = ships_hash.map {|ship| Ship.new(ship)}
    return result
  end

  def Ship.delete_all()
    sql = "DELETE FROM ships"
    SqlRunner.run(sql)
  end
end
# binding.pry
# nil
