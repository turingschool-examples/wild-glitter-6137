require "rails_helper"

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    it { should have_many(:plot_plants) }
    it { should have_many(:plots).through(:plot_plants)}
  end

  describe "#fast_plants" do
    it "returns plants that take less than 100 days to harvest and are unique" do
      garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
      plot_1 = garden_1.plots.create!(number: 25, size: "Large", direction: "East")
      plot_2 = garden_1.plots.create!(number: 31, size: "Medium", direction: "West")
      plot_3 = garden_1.plots.create!(number: 18, size: "Small", direction: "North")
  
      plant_1 = Plant.create!(name: "Flower", description: "Beautiful", days_to_harvest: 14)
      plant_2 = Plant.create!(name: "Watermelon", description: "Big", days_to_harvest: 60)
      plant_3 = Plant.create!(name: "Tomato", description: "Yummy", days_to_harvest: 190)

      plot_1.plants << plant_1
      plot_1.plants << plant_2
      plot_2.plants << plant_2
      plot_2.plants << plant_3

      fast_plants = Plant.fast_plants(garden_1.id)
      
      expect(fast_plants).to eq([plant_1, plant_2])
    end
  end
end