require_relative('../db/sql_runner')

class Screening
  attr_reader :id
  attr_accessor :film_id, :showtimes

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @film_id = details['film_id'].to_i
    @showtimes = details['showtimes']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, showtimes) VALUES ($1, $2) RETURNING id;"
    values = [@film_id, @showtimes]
    screening = SqlRunner.run(sql, values)[0]
    @id = screening['id'].to_i
  end





#
end
