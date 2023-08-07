require "rails_helper"

RSpec.describe "gardens show page", type: :feature do

# User Story 3, Garden's Plants
# As a visitor
# When I visit a garden's show page ('/gardens/:id')
# Then I see a list of plants that are included 
# in that garden's plots
# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take 
# less than 100 days to harvest

  describe "when I visit a garden's show page" do
    it "displays  a list of plants that are included in that garden's plots" do
      garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
      plot_1 = garden_1.plots.create!(number: 25, size: "Large", direction: "East")
      plot_2 = garden_1.plots.create!(number: 31, size: "Medium", direction: "West")
      plot_3 = garden_1.plots.create!(number: 18, size: "Small", direction: "North")
  
      plant_1 = Plant.create!(name: "Flower", description: "Beautiful", days_to_harvest: 14)
      plant_2 = Plant.create!(name: "Watermelon", description: "Big", days_to_harvest: 60)
      plant_3 = Plant.create!(name: "Tomato", description: "Yummy", days_to_harvest: 90)

      plot_1.plants << plant_1
      plot_1.plants << plant_2
      plot_2.plants << plant_2
      plot_2.plants << plant_3

      visit garden_path(garden_1)

      expect(page).to have_content(plant_1.name)
      expect(page).to have_content(plant_2.name)
      expect(page).to have_content(plant_3.name)
    end
  end
end