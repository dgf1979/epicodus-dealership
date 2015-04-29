require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('the vehicles path', {:type => :feature}) do
  it('visits the root page') do
    visit('/')
    expect(page).to have_content("Welcome to Vehicle Saver")
  end
end
