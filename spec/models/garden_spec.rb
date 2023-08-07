require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe "instance_methods" do 
    before :each do
      @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
      
      @plot_1 = @garden_1.plots.create!(number: 25, size: "Large", direction: "East")
      @plot_2 = @garden_1.plots.create!(number: 20, size: "Medium", direction: "West")
  
      @bell = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      @pepper = Plant.create!(name: "Banana pepper", description: "Prefers heat and a long growing season.", days_to_harvest: 70)
      
      @sweet = Plant.create!(name: "Sweet Potato", description: "Prefers warm weather and warm soil.", days_to_harvest: 95)
      @onion = Plant.create!(name: "Onion", description: "layers????", days_to_harvest: 110)
  
      PlantPlot.create!(plant: @bell, plot: @plot_1)
      PlantPlot.create!(plant: @pepper, plot: @plot_1)
      PlantPlot.create!(plant: @sweet, plot: @plot_1)
  
      PlantPlot.create!(plant: @sweet, plot: @plot_2)
      PlantPlot.create!(plant: @onion, plot: @plot_2)
      
    end
  
    describe "#plant_list" do
      it "returns an array of unique plants that harvests are under 100" do 
        expect(@garden_1.plant_list).to match_array([@bell, @pepper, @sweet])
      end
    end
  end
end