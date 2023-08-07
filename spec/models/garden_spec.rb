require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe "instance methods" do
    before :each do
      @garden_1 = Garden.create!(name: "Garden Variety", organic: true)
      @garden_2 = Garden.create!(name: "Monocrop City", organic: false)
      
      @plot_1 = @garden_1.plots.create!(number: 10, size: "Small", direction: "North")
      @plot_2 = @garden_1.plots.create!(number: 20, size: "Medium", direction: "East")
      @plot_3 = @garden_2.plots.create!(number: 25, size: "Medium", direction: "South")
      @plot_4 = @garden_2.plots.create!(number: 50, size: "Large", direction: "West")
      @plot_5 = @garden_1.plots.create!(number: 5, size: "Micro", direction: "West")
  
      @plant_1 = Plant.create!(name: "Wild Iris", description: "Delicate and beautiful", days_to_harvest: 120)
      @plant_2 = Plant.create!(name: "Rose", description: "Thorny", days_to_harvest: 50)
      @plant_3 = Plant.create!(name: "Sunflower", description: "Brightens up any place!", days_to_harvest: 40)
      @plant_4 = Plant.create!(name: "Aloe", description: "Soothing", days_to_harvest: 30)
      @plant_5 = Plant.create!(name: "Monstera", description: "Low light plant", days_to_harvest: 20)
      @plant_6 = Plant.create!(name: "Hanging Vine", description: "Spindly vines", days_to_harvest: 10)
  
      @plant_plot_1 = PlantPlot.create!(plant_id: @plant_1.id, plot_id: @plot_1.id)
      @plant_plot_2 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_1.id)
      @plant_plot_3 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_2.id)
      @plant_plot_4 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_5.id)
      @plant_plot_5 = PlantPlot.create!(plant_id: @plant_3.id, plot_id: @plot_2.id)
      @plant_plot_6 = PlantPlot.create!(plant_id: @plant_3.id, plot_id: @plot_5.id)
    end

    it "can produce a unique list of plants within garden plots that take less than 100 days to harvest" do
      expect(@garden_1.sub_100_to_harvest).to eq([@plant_2, @plant_3])
    end

    it "shows list of plants sorted by number of appearances in any of that garden's plots" do
      expect(@garden_1.plants_by_quantity).to eq([@plant_2, @plant_3, @plant_1])
    end
  end
end