require_relative('../db/sql_runner')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def Customer.all()
    sql = "SELECT * FROM customers;"
    data = SqlRunner.run(sql)
    return data.map{|customer| Customer.new(customer)}
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  #Show which films a customer has booked to see

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return film_data.map {|film| Film.new(film)}
  end

  #Select full hash of film info from films table,
  #Check on the join table named tickets
  #compare films table id column to tickets table film_id column
  #Where the tickets-table customer_id column = customer(specified customer)

  #check how many tickets were bought by a customer, same as above but with .count on array of hashes returned.
  def how_many_tickets
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return film_data.count
  end

  def buy_tickets
    attending = self.films
    cost_per_film = attending.map{|ticket| ticket.price}
    total_to_pay = cost_per_film.sum
    change = @funds - total_to_pay
    p "Your total is #{total_to_pay}"
    "Your change is #{change}"
  end










#
end
