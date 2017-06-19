require_relative '../db/sql_runner'
require_relative 'deal'
require_relative 'flight'
require_relative 'ship'

class FlightDeal

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @flight_id = options['flight_id'].to_i
    @deal_id = options['deal_id'].to_i
  end


    def save
      sql = "INSERT INTO flight_deals (
      flight_id, deal_id
      ) VALUES (
      #{@flight_id}, #{@deal_id}
      ) RETURNING id"
      result = SqlRunner.run(sql)
      @id = result.first()['id'].to_i
    end

    def FlightDeal.delete_all()
      sql = "DELETE FROM flight_deals"
      SqlRunner.run(sql)
    end


end
