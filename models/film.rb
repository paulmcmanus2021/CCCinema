require_relative('../db/sql_runner')

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @price = details['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film['id'].to_i
  end

  def Film.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end














#
end
