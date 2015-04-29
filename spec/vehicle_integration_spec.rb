require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the vehicles path', {:type => :feature}) do
  it('visits the root page') do
    visit('/')
    expect(page).to have_content("Welcome to Vehicle Saver")
  end

  it('adds a vehicle and verifies that it exists in the list') do
    visit('vehicles/new')
    fill_in('make', :with => 'Buick')
    fill_in('model', :with => 'Skylark')
    fill_in('year', :with => '1970')
    click_button('Add Vehicle')
    expect(page).to have_content("Skylark")
  end
end
