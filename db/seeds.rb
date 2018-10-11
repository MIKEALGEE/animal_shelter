require_relative('../models/customer.rb')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require("pry")

Owner.delete_all
Customer.delete_all
Animal.delete_all

customer1 = Customer.new({
  "first_name" => "Mike",
  "last_name" => "Griffin",
  "appointment" => "07/12/2018",
  "requirements" => "Needs to be good with children"
  })

customer2 = Customer.new({
  "first_name" => "Wee",
  "last_name" => "Dave",
  "appointment" => "06/11/2018",
  "requirements" => "Needs to be house trained"
  })

customer3 = Customer.new({
  "first_name" => "Captain",
  "last_name" => "Hook",
  "appointment" => "05/12/2018",
  "requirements" => "Disabled, looking for a creature that can help with daily tasks."
  })

customer1.save()
customer2.save()
customer3.save()



animal1 = Animal.new({
  "animal_name" => "Max",
  "species" => "Dog",
  "age" => 8,
  "training" => "Yes",
  "adoptable" => "Yes",
  "admission_date" => "10/22/2018",
  "description" => "Max is a floof, who is scared of the dark and has explosive diarreah regularly. He can be quite funny, though."
})

animal2 = Animal.new({
  "animal_name" => "Jesse",
  "species" => "Cat",
  "age" => 6,
  "training" => "Yes",
  "adoptable" => "No",
  "admission_date" => "9/15/2017",
  "description" => "Jesse's a catnip addict and is usually out on the streets selling her body for cash. She loves to play with cotton balls!"
})

animal3 = Animal.new({
  "animal_name" => "Jason",
  "species" => "Dinosaur",
  "age" => 14,
  "training" => "Yes",
  "adoptable" => "No",
  "admission_date" => "2/15/2016",
  "description" => "Jason loves to eat children so this is worth keeping in mind if you love your kids, if not, make an appointment and be sure to bring them along!"
})

animal1.save()
animal2.save()
animal3.save()



owner1 = Owner.new({
  "customer_id" => customer1.id,
  "animal_id" => animal1.id
  })

owner2 = Owner.new({
  "customer_id" => customer2.id,
  "animal_id" => animal3.id
  })

owner1.save()
owner2.save()
