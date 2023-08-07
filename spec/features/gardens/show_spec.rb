require 'rails_helper'

RSpec.describe 'Gardens Show page' do 
#   User Story 3, Garden's Plants

# As a visitor
# When I visit a garden's show page ('/gardens/:id')

# Then I see a list of plants that are included in that garden's plots
# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take less than 100 days to harvest

  describe 'when I visit a garden show page' do

    it 'I see a list of plants that are included in that garden plots' do
      garden_1 = Garden.create!(name: "Denver Botanic Garden", organic: false)

      plot_1 = garden_1.plots.create!(number: 1, size: "Large", direction: "North")
      plot_2 = garden_1.plots.create!(number: 2, size: "Small", direction: "East")

      plant_1 = Plant.create!(name: "Purple Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      plant_2 = Plant.create!(name: "Red Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      plant_3 = Plant.create!(name: "Green Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      plant_4 = Plant.create!(name: "Yellow Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 110)

      PlantPlot.create!(plot: plot_1, plant: plant_1)
      PlantPlot.create!(plot: plot_1, plant: plant_2)

      PlantPlot.create!(plot: plot_2, plant: plant_3)
      PlantPlot.create!(plot: plot_2, plant: plant_4)
      PlantPlot.create!(plot: plot_2, plant: plant_1)

      visit "/gardens/#{garden_1.id}"
      
      expect(page).to have_content(garden_1.name)
      expect(page).to have_content(plant_1.name, count: 1)
      expect(page).to have_content(plant_2.name)
      expect(page).to have_content(plant_3.name)
      expect(page).to_not have_content(plant_4.name)
    end
  end
end