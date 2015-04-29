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

end
