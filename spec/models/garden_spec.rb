require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe 'instance methods' do
    it "unique_plants" do
      @g1 = Garden.create!(name: "Fertilizer Spaceship", organic: true)
      @v1 = Plant.create!(name: "Potato", description: "spud", days_to_harvest: 22)
      @v2 = Plant.create!(name: "Carrot", description: "orange spike", days_to_harvest: 33)
      @v3 = Plant.create!(name: "Rhubarb", description: "red celery", days_to_harvest: 44)
      @v4 = Plant.create!(name: "Tomato", description: "red berry", days_to_harvest: 101)
      @p1 = Plot.create!(number: 1, size: "large", direction: "north", garden: @g1)
      @p2 = Plot.create!(number: 2, size: "medium", direction: "south", garden: @g1)
      PlotPlant.create!(plot: @p1, plant: @v1)
      PlotPlant.create!(plot: @p2, plant: @v2)
      PlotPlant.create!(plot: @p1, plant: @v3)
      PlotPlant.create!(plot: @p2, plant: @v3)

      expect(@g1.unique_plants).to eq([@v1, @v2, @v3])
    end
  end
end