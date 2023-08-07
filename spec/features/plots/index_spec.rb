require 'rails_helper'

RSpec.feature 'Plots Index Page', type: :feature do
  scenario 'visitor sees list of plot numbers and associated plant names' do
    # Create some plots and plants for testing
    garden = Garden.create!(name: 'Backstreet Garden', organic: true)
    plot1 = Plot.create!(number: 1, size: 'Large', direction: 'North', garden: garden)
    plot2 = Plot.create!(number: 2, size: 'Small', direction: 'East', garden: garden)
    plant1 = Plant.create!(name: 'Tomato', description: 'Tasty', days_to_harvest: 90)
    plant2 = Plant.create!(name: 'Lettuce', description: 'Crunchy', days_to_harvest: 30)

  
    # Associate plants with plots
    plot1.plants << plant1
    plot1.plants << plant2
    plot2.plants << plant2

    visit plots_path

    within("#plot-#{plot1.number}") do
      expect(page).to have_content("Plot Number: #{plot1.number}")
      expect(page).to have_content("Tomato")
      expect(page).to have_content("Lettuce")
    end
    
    within("#plot-#{plot2.number}") do
      expect(page).to have_content("Plot Number: #{plot2.number}")
      expect(page).to have_content("Lettuce")
      expect(page).to_not have_content("Tomato")
    end  
  end
  scenario 'visitor can delete a plant' do
    garden = Garden.create!(name: 'Backstreet Garden', organic: true)
    plot1 = Plot.create!(number: 1, size: 'Large', direction: 'North', garden: garden)
    plot2 = Plot.create!(number: 2, size: 'Small', direction: 'East', garden: garden)
    plant1 = Plant.create!(name: 'Tomato', description: 'Tasty', days_to_harvest: 90)
    plant2 = Plant.create!(name: 'Lettuce', description: 'Crunchy', days_to_harvest: 30)

    plot1.plants << plant1
    plot1.plants << plant2
    plot2.plants << plant2

    visit plots_path

    within("#plot-#{plot1.number}") do
      expect(page).to have_link("Remove #{plant2.name}")
    
      click_link("Remove #{plant2.name}")
    end

    within("#plot-#{plot1.number}") do
      expect(page).to_not have_content("Lettuce")
    end

    within("#plot-#{plot2.number}") do
      expect(page).to have_content("Lettuce")
      expect(page).to_not have_content("Tomato")
    end  
  end
end
