require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots)}
  end

  describe "instance methods" do
    it "#gardens_plants" do
      garden_1 = Garden.create!(name: "botanic gardens", organic: true) 
      plot_1 = garden_1.plots.create!(number: 1, size: "small", direction: "west")
      plant_1 = Plant.create!(name: "rose", description: "red", days_to_harvest: 15)
      plant_2 = Plant.create!(name: "cactus", description: "green", days_to_harvest: 25)
      plant_plot1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
      plant_plot2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_1.id)
      
      plot_2 = garden_1.plots.create!(number: 2, size: "medium", direction: "east")
      plant_3 = Plant.create!(name: "daff", description: "yellow", days_to_harvest: 5)
      plant_4 = Plant.create!(name: "green", description: "green", days_to_harvest: 101)
      plant_plot3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_2.id)
      plant_plot4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_2.id)
      plant_plot5 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_2.id)

      expect(garden_1.gardens_plants).to eq([plant_1, plant_2, plant_3])
    end
  end

  
end