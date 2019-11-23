require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()

#customers
  customer1 = Customer.new({
    'name' => 'Joel Robinson',
    'funds' => 20
    })
    customer1.save()
  customer2 = Customer.new({
    'name' => 'Crow T. Robot',
    'funds' => 15
    })
    customer2.save()
  customer3 = Customer.new({
    'name' => 'Tom Servo',
    'funds' => 10
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
    'price' => 6
    })
    film3.save()
#end films

binding.pry
nil
