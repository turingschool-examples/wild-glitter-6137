require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    garden_1 = Garden.create!(name: "Denver Botanic Garden", organic: false)

    plot_1 = garden_1.plots.create!(number: 1, size: "Large", direction: "North")
    plot_2 = garden_1.plots.create!(number: 2, size: "Small", direction: "East")

    plant_1 = Plant.create!(name: "Purple Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    plant_2 = Plant.create!(name: "Red Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    plant_3 = Plant.create!(name: "Green Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    plant_4 = Plant.create!(name: "Yellow Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 100)

    PlantPlot.create!(plot: plot_1, plant: plant_1)
    PlantPlot.create!(plot: plot_1, plant: plant_2)

    PlantPlot.create!(plot: plot_2, plant: plant_3)
    PlantPlot.create!(plot: plot_2, plant: plant_4)
    PlantPlot.create!(plot: plot_2, plant: plant_1)

    it 'unique_plants' do 
      expect(garden_1.unique_plants).to match_array([plant_1.name, plant_2.name, plant_3.name])
    end
  end
end