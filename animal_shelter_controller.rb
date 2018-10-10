require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( './models/animal.rb' )
require_relative( './models/customer.rb' )
also_reload( './models/*' )

get("/") do
  erb(:home)
end

get("/customer-list") do
  @customers = Customer.all()
  erb(:customers)
end

get("/animal-shelter") do
  @animals = Animal.all()
  erb(:animals)
end

# NEW
get("/animal-shelter/new") do
  erb(:new_animal)
end

#CREATE
post("/animal-shelter/animal-submitted") do
  @animal = Animal.new(params)
  @animal.save()
  erb(:animal_submitted)
end

get("/animal-shelter/:id/update") do
  id = params[:id].to_i()
  @animal = Animal.find(id)
  erb(:update_animal)
end

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
