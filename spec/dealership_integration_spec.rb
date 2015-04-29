require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the dealership path", {:type => :feature}) do
  it("visits the root page") do
    visit('/')
    expect(page).to have_content('Dealership')
  end

  it("adds a dealership and verfies that is exists in dealership list") do
    visit('/dealerships/new')
    fill_in('name', :with => "Bob's Discount Cars")
    click_button('Add Dealership')
    expect(page).to have_content("Bob's Discount Cars")
  end

  it('adds a dealership and verifies that it exists individually by id') do
    visit('/dealerships/new')
    fill_in('name', :with => "Bob's Discount Cars")
    click_button('Add Dealership')
    visit('/dealership/1')
    expect(page).to have_content("Bob's Discount Cars")
  end

  it('adds a car to a dealership') do
    #add dealership
    visit('/dealerships/new')
    fill_in('name', :with => "Bob's Discount Cars")
    click_button('Add Dealership')

    #add cars to dealership
    visit('/dealership/1/vehicle/new')
    fill_in('make', :with => "Honda")
    fill_in('model', :with => "Civic")
    fill_in('year', :with => "1999")
    click_button('Add Vehicle')

    #visit dealership to verfy car exists
    visit('/dealership/1')
    expect(page).to have_content("Honda")
  end
end
