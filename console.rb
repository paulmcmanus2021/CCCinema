require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/screening')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


#customers
  customer1 = Customer.new({
    'name' => 'Joel Robinson',
    'funds' => 15
    })
    customer1.save()
  customer2 = Customer.new({
    'name' => 'Crow T. Robot',
    'funds' => 10
    })
    customer2.save()
  customer3 = Customer.new({
    'name' => 'Tom Servo',
    'funds' => 4
    })
    customer3.save()
#end customers

#films
  film1 = Film.new({
    'title' => 'This Island Earth',
    'price' => 4
    })
    film1.save()
  film2 = Film.new({
    'title' => 'The Crawling Eye',
    'price' => 5
    })
    film2.save()
  film3 = Film.new({
    'title' => 'Mitchell',
    'price' => 5
    })
    film3.save()
#end films

#tickets
  ticket1 = Ticket.new({'customer_id' => customer1.id,'film_id' => film1.id})
  ticket1.save()
  ticket2 = Ticket.new({'customer_id' => customer1.id,'film_id' => film2.id})
  ticket2.save()
  ticket3 = Ticket.new({'customer_id' => customer1.id,'film_id' => film3.id})
  ticket3.save()
  ticket4 = Ticket.new({'customer_id' => customer2.id,'film_id' => film1.id})
  ticket4.save()
  ticket5 = Ticket.new({'customer_id' => customer2.id,'film_id' => film2.id})
  ticket5.save()
  ticket6 = Ticket.new({'customer_id' => customer3.id,'film_id' => film1.id})
  ticket6.save()
#end tickets

#screenings
  screening1 = Screening.new({'film_id' => film1.id, 'showtimes' => '12:00'})
  screening1.save()
  screening2 = Screening.new({'film_id' => film1.id, 'showtimes' => '15:00'})
  screening2.save()
  screening3 = Screening.new({'film_id' => film1.id, 'showtimes' => '18:00'})
  screening3.save()
  screening4 = Screening.new({'film_id' => film1.id, 'showtimes' => '21:00'})
  screening4.save()
  screening5 = Screening.new({'film_id' => film2.id, 'showtimes' => '14:30'})
  screening5.save()
  screening6 = Screening.new({'film_id' => film2.id, 'showtimes' => '16:30'})
  screening6.save()
  screening7 = Screening.new({'film_id' => film2.id, 'showtimes' => '18:30'})
  screening7.save()
  screening8 = Screening.new({'film_id' => film2.id, 'showtimes' => '20:30'})
  screening8.save()
  screening9 = Screening.new({'film_id' => film3.id, 'showtimes' => '17:00'})
  screening9.save()
  screening10 = Screening.new({'film_id' => film3.id, 'showtimes' => '19:00'})
  screening10.save()
  screening11 = Screening.new({'film_id' => film3.id, 'showtimes' => '21:00'})
  screening11.save()
  screening12 = Screening.new({'film_id' => film3.id, 'showtimes' => '23:00'})
  screening12.save()
#end screenings

binding.pry
nil
