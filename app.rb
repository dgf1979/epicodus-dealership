require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')

get('/') do
  erb(:index)
end

get('/vehicles') do
  erb(:vehicles)
end

post('/vehicles') do
  erb(:vehicles)
end

get('/vehicles/new') do
  erb(:vehicles_form)
end
