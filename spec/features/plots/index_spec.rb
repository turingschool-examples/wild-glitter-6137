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
    
    @plot1.plants << @plant1
    @plot2.plants << @plant1
    @plot2.plants << @plant2

    visit '/plots'
  end

  it 'lists plot numbers and their associated plants' do
    expect(page).to have_content("Plot Number: #{@plot1.number}")
    expect(page).to have_content("Plot Number: #{@plot2.number}")
    expect(page).to have_content("Plot Number: #{@plot3.number}")

    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content("No plants in this plot.")
  end

  xit 'can delete plants from a plot' do

    # User Story 2, Remove a Plant from a Plot
    # As a visitor
    # When I visit the plots index page
    # Next to each plant's name
    # I see a link to remove that plant from that plot
    # When I click on that link
    # I'm returned to the plots index page
    # And I no longer see that plant listed under that plot,
    # And I still see that plant's name under other plots that is was associated with.

    # Verify that the plant names are listed on the page
    expect(page).to have_content(@plant1.name)

    # Find the first occurrence of the element containing the plant's name and click the "Remove" link/button within that context.
    first("p", text: @plant1.name).click_button("Remove")
  
    # Expect that the plant name is no longer present on the page after removing it from the plot.
    expect(page).not_to have_content(@plant1.name)
  end

  
end