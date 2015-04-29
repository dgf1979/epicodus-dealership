require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')
require('pry')

get('/') do
  erb(:index)
end

get('/vehicle/:id') do
  @vehicle = Vehicle.find(params.fetch('id'))
  erb(:vehicle)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/vehicles/new') do
  erb(:vehicles_form)
end

#list all dealerships
get('/dealerships') do
  erb(:dealerships)
end

#submit a new dealership
post('/dealerships') do
  name = params.fetch('name')
  dealership = Dealership.new(name)
  dealership.save()
  @dealerships = Dealership.all()
  erb(:dealerships)
end

#add a new dealership
get('/dealerships/new') do
  erb(:dealerships_form)
end

get('/dealership/:id') do
  erb(:dealership)
end
