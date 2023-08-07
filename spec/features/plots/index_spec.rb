require 'rails_helper'

RSpec.describe 'Plots index page', type: :feature do

  # User Story 1, Plots Index Page
  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see the names of all that plot's plants

  before do
    @garden = Garden.create(name: 'Test Garden')

    @plot1 = @garden.plots.create(number: 1)
    @plot2 = @garden.plots.create(number: 2)
    @plot3 = @garden.plots.create(number: 3)

    @plant1 = Plant.create(name: 'Plant 1', description: 'Description 1', days_to_harvest: 90)
    @plant2 = Plant.create(name: 'Plant 2', description: 'Description 2', days_to_harvest: 80)
    @plant3 = Plant.create(name: 'Plant 3', description: 'Description 3', days_to_harvest: 70)

    @plot1.plants << @plant1
    @plot2.plants << @plant2
    @plot1.plants << @plant3

    visit '/plots'
  end

  it 'lists plot numbers and their associated plants' do
    expect(page).to have_content("Plot Number: #{@plot1.number}")
    expect(page).to have_content("Plot Number: #{@plot2.number}")
    expect(page).to have_content("Plot Number: #{@plot3.number}")

    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)
    expect(page).to have_content("No plants in this plot.")
  end
  
end