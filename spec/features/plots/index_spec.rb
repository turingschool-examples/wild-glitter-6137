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
end
