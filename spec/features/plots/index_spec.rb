require 'rails_helper'

RSpec.describe 'Plots Index', type: :feature do
  before :each do
    load_test_data
  end

  # User Story 1, Plots Index Page

  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see the names of all that plot's plants

  it 'displays all plot numbers and names of all of that plots plants' do
    visit plots_path

    [@plot1, @plot2, @plot3].each do |plot|
      within("#plot-#{plot.id}") do
        expect(page).to have_content("Plot Number: #{plot.number}")
        plot.plants.each do |plant|
          expect(page).to have_content(plant.name)
        end
      end
    end
  end

  # User Story 2, Remove a Plant from a Plot

  # As a visitor
  # When I visit the plots index page
  # Next to each plant's name
  # I see a link to remove that plant from that plot
  # When I click on that link
  # I'm returned to the plots index page
  # And I no longer see that plant listed under that plot,
  # And I still see that plant's name under other plots that is was associated with.

  # NOTE: you do not need to test for any sad paths or implement any flash messages.

  it 'has a link to remove a plant from a plot but still show that plant in another plot' do
    visit plots_path

    within("#plot-#{@plot1.id}") do
      expect(page).to have_content(@plant1.name)
    end

    within("#plot-#{@plot2.id}") do
      expect(page).to have_content(@plant1.name)
    end

    within("#plot-#{@plot1.id}") do
      within("#plant_name_#{@plant1.id}") do
        click_button 'Remove'
      end
    end

    expect(current_path).to eq(plots_path)

    within("#plot-#{@plot1.id}") do
      expect(page).to_not have_content(@plant1.name)
    end

    within("#plot-#{@plot2.id}") do
      expect(page).to have_content(@plant1.name)
    end
  end
end
