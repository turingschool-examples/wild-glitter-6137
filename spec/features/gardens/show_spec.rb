require 'rails_helper'

RSpec.describe "/gardens/:id" do
  before do
    @brave = Garden.create!(name: "Brave Harvest", organic: true)
    @plot_1 = @brave.plots.create!(number: 1, size: "Medium", direction: "North")
    @plot_2 = @brave.plots.create!(number: 2, size: "Small", direction: "East")
    @tomato = Plant.create!(name: "Tomato", description: "Red", days_to_harvest: 40)
    @bell = Plant.create!(name: "Bell Pepper", description: "Tasty", days_to_harvest: 20)
    @eggplant = Plant.create!(name: "Eggplant", description: "Purple", days_to_harvest: 30)
    @artichoke = Plant.create!(name: "Artichoke", description: "Pointy", days_to_harvest: 120)
    @plant_plot_1 = PlantPlot.create!(plant: @tomato, plot: @plot_1)
    @plant_plot_2 = PlantPlot.create!(plant: @bell, plot: @plot_1)
    @plant_plot_3 = PlantPlot.create!(plant: @bell, plot: @plot_2)
    @plant_plot_4 = PlantPlot.create!(plant: @eggplant, plot: @plot_2)
    @plant_plot_5 = PlantPlot.create!(plant: @artichoke, plot: @plot_2)
    @plant_plot_6 = PlantPlot.create!(plant: @eggplant, plot: @plot_2)
  end
  describe "When I visit a gardens show page" do
    it "displays a list of plants that is unique and only contains plants that take less than 100 days to harvest" do
      visit "/gardens/#{@brave.id}"

      within "#plants-list" do
        expect(page).to have_content(@tomato.name)
        expect(page).to have_content(@bell.name)
        expect(page).to have_content(@eggplant.name)
        expect(page).to_not have_content(@artichoke.name)
        
        expect(page).to have_selector(".plant-item", count: 3)
      end
    end
  end
end
