require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  before :each do
    # Gardens
    @garden_a = Garden.create!(name: "Ethan's Test Garden", organic: true)
    @garden_b = Garden.create!(name: "Ethan CORP Industrial Garden", organic: false)
    
    # Plots
    @plot_a1 = @garden_a.plots.create!(number: 1, size: "Medium", direction: "West")
    @plot_a2 = @garden_a.plots.create!(number: 2, size: "Small", direction: "East")
    
    @plot_b1 = @garden_b.plots.create!(number: 1, size: "Large", direction: "North")
    
    # Plants
    @plant_1 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 50)
    @plant_2 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 80)
    @plant_3 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 90)
    @plant_4 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 100)

    # Add plants to plots
    @plot_a1_plant_1 = PlotPlant.create!(plot_id: @plot_a1.id, plant_id: @plant_1.id)
    @plot_a1_plant_2 = PlotPlant.create!(plot_id: @plot_a1.id, plant_id: @plant_2.id)
    @plot_a1_plant_3 = PlotPlant.create!(plot_id: @plot_a1.id, plant_id: @plant_3.id)

    @plot_a2_plant_2 = PlotPlant.create!(plot_id: @plot_a2.id, plant_id: @plant_2.id)
    @plot_a2_plant_3 = PlotPlant.create!(plot_id: @plot_a2.id, plant_id: @plant_3.id)
    @plot_a2_plant_4 = PlotPlant.create!(plot_id: @plot_a2.id, plant_id: @plant_4.id)

    @plot_b1_plant_3 = PlotPlant.create!(plot_id: @plot_b1.id, plant_id: @plant_3.id)
    @plot_b1_plant_4 = PlotPlant.create!(plot_id: @plot_b1.id, plant_id: @plant_4.id)
  end

  describe "Instance methods" do
    describe "#distinct_sub100_plants" do
      it "returns a unique list of plants in the garden that take less than 100 days to harvest" do
        expect(@garden_a.distinct_sub100_plants).to match_array([@plant_1, @plant_2, @plant_3])
        expect(@garden_b.distinct_sub100_plants).to match_array([@plant_3])
      end
    end
  end
end