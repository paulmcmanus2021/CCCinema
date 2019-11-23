require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')

require('pry-byebug')

# Customer.delete_all()

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

binding.pry
nil
