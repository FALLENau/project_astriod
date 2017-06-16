require_relative '../db/sql_runner'
# require_relative 'flight'
require 'pry-byebug'

class Ship
  attr_reader :name, :url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @url = options['url']
  end

  def save
    sql = "INSERT INTO ships (
    name, url
    ) VALUES (
    '#{name}', '#{url}'
    ) RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end
end

# binding.pry
# nil
