require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( './models/animal.rb' )
require_relative( './models/customer.rb' )
also_reload( './models/*' )


get("/animal-shelter") do
  @animals = Animal.all()
  erb(:animals)
end

# get("/animal-shelter") do
#   @animals = Animal.all()
#   erb(:animals)
# end
