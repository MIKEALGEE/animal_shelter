require_relative('../models/customer.rb')
require_relative('../models/animal.rb')

# seeds - prepopulates the database for us.

Customer.delete_all
Animal.delete_all

customer1 = Customer.new({
  "first_name" => "Mike",
  "last_name" => "Griffin"
  })

customer2 = Customer.new({
  "first_name" => "Wee",
  "last_name" => "Dave"
  })

customer3 = Customer.new({
  "first_name" => "Captain",
  "last_name" => "Hook"
  })

customer1.save()
customer2.save()
customer3.save()



animal1 = Animal.new({
  "animal_name" => "Max",
  "species" => "Dog",
  "age" => 8,
  "training" => "Yes",
  "adoptable" => "No",
  "admission_date" => "10/22/2018"
})

animal2 = Animal.new({
  "animal_name" => "Jesse",
  "species" => "Cat",
  "age" => 6,
  "training" => "Yes",
  "adoptable" => "No",
  "admission_date" => "9/15/2017"
})

animal3 = Animal.new({
  "animal_name" => "Jason",
  "species" => "Dinosaur",
  "age" => 14,
  "training" => "Yes",
  "adoptable" => "No",
  "admission_date" => "2/15/2016"
})

animal1.save()
animal2.save()
animal3.save()
