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

# DELETE
post("/animal-shelter/:id/delete") do
  id = params[:id].to_i()
  @pizza = Animal.find(id).delete()
  erb(:delete)
end


# post '/pizza-orders/:id' do # update
#   PizzaOrder.new( params ).update
#   redirect to '/pizza-orders'
# end


# get("/animal-shelter/:id/view") do
#   id = params[:id].to_i()
#   @animal = Animal.find(id)
#   erb(:view_animal)
# end

# # SHOW
# # id will take ANYTHING - so this needs to go lower in the priority.
# get("/pizza-orders/:id") do
#   id = params[:id].to_i()
#   @pizza = PizzaOrder.find(id)
#   erb(:show)
# end
#
# #CREATE
# post("/pizza-orders") do
#   @pizza = PizzaOrder.new(params)
#   @pizza.save()
#   erb(:create)
# end
#
# # DELETE
# post("/pizza-orders/:id/delete") do
#   id = params[:id].to_i()
#   @pizza = PizzaOrder.find(id).delete()
#   erb(:destroy)
# end
#
#
