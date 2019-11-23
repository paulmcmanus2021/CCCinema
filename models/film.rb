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

  def Film.all()
    sql = "SELECT * FROM films;"
    data = SqlRunner.run(sql)
    return data.map{|film| Film.new(film)}
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
   sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
   values = [@title, @price, @id]
   SqlRunner.run(sql, values)
  end

  # Show which customers are going to see one film

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return customer_data.map {|customer| Customer.new(customer)}
  end

  













#
end
