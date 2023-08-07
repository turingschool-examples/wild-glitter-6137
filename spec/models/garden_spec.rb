require "rails_helper"

RSpec.describe Garden, type: :model do
    before(:each) do
    @garden = Garden.create!(name: "Wild Flowers", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Medium", direction: "East")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "West")

    @plant1 = Plant.create!(name: "New England Aster", description: "Perennial salt-tolerant plant", days_to_harvest: 10)
    @plant2 = Plant.create!(name: "Blanket Flowers", description: "Plains Wildflower", days_to_harvest: 180)
    @plant3 = Plant.create!(name: "Queen Anne's Lace", description: "Related to carrots and smells like carrots", days_to_harvest: 14)

    # Plot 1
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant2.id)
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant3.id)
    # Plot 2
    PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant1.id)
    PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant2.id)
  end

  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe "instance_methods" do
    describe "plants_with_quick_harvest" do
      it "can return a unique list of plants that have less than 100 days to harvest" do
        expect(@garden.plants_with_quick_harvest).to eq([@plant1.name, @plant3.name])
      end
    end

    describe "sorted_list_of_flowers" do
      it "can create a sorted list of flowers in the garden" do
        expect(@garden.sorted_list_of_flowers).to eq(["Blanket Flowers", "New England Aster", "Queen Anne's Lace"])
      end
    end
  end
end