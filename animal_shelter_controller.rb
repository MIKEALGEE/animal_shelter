require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require('active_support/core_ext/date')
require_relative( './models/owner.rb' )
require_relative( './models/animal.rb' )
require_relative( './models/customer.rb' )

also_reload( './models/*' )

#HOME PAGE

get("/") do
  erb(:home)
end

#SHOWING LIST OF ALL CUSTOMERS

get("/customer-list") do
  @customers = Customer.all()
  erb(:customers)
end

#SHOWING LIST OF ALL OWNERS

get("/owners") do
  @owners = Owner.all()
  erb(:view_owners)
end

#SHOWING LIST OF ALL ANIMALS

get("/animal-shelter") do
  @animals = Animal.all()
  erb(:animals)
end

#CREATING ANIMAL
get("/animal-shelter/new") do
  erb(:new_animal)
end

#SAVING NEW ANIMAL

post("/animal-shelter/animal-submitted") do
  @animal = Animal.new(params)
  @animal.save()
  erb(:animal_submitted)
end

#VIEWING ANIMAL

get("/animal-shelter/:id/view") do
  id = params[:id].to_i()
  @animal = Animal.find(id)
  erb(:view_animal)
end

#UPDATING ANIMAL

get("/animal-shelter/:id/update") do
  id = params[:id].to_i()
  @animal = Animal.find(id)
  erb(:update_animal)
end

post("/animal-shelter/:id/animal-updated") do
  id = params[:id].to_i
  Animal.new(params).update
  erb(:animal_updated)
end

# DELETE ANIMAL
post("/animal-shelter/:id/delete") do
  id = params[:id].to_i()
  @animal = Animal.find(id).delete()
  erb(:delete)
end

#START OF CUSTOMER CONTROLS

#CREATING CUSTOMER
get("/animal-shelter/customer/new") do
  erb(:new_customer)
end

#SAVING NEW CUSTOMER

post("/animal-shelter/customer/customer-saved") do
  @customer = Customer.new(params)
  @customer.save()
  erb(:save_customer)
end

#VIEWING CUSTOMER

get("/animal-shelter/customer/:id/view") do
  id = params[:id].to_i()
  @customer = Customer.find(id)
  erb(:view_customer)
end


#UPDATING CUSTOMER

get("/animal-shelter/customer/:id/update") do
  id = params[:id].to_i()
  @customer = Customer.find(id)
  erb(:update_customer)
end

post("/animal-shelter/customer/:id/customer-updated") do
  id = params[:id].to_i
  Customer.new(params).update
  erb(:customer_updated)
end

# DELETE CUSTOMER
post("/animal-shelter/customer/:id/delete") do
  id = params[:id].to_i()
  @customer = Customer.find(id).delete()
  erb(:delete_customer)
end
