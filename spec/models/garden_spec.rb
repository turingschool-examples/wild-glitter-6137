require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plot_plants).through(:plots) }
    it { should have_many(:plants).through(:plot_plants) }
  end

  describe 'instance methods' do
    before :each do
      @garden_1 = Garden.create!(name: "Denver Community Garden", organic: false)

      @plot_1 = @garden_1.plots.create!(number: 12, size: "Medium", direction: "South")
      @plot_2 = @garden_1.plots.create!(number: 23, size: "small", direction: "North")
      @plot_3 = @garden_1.plots.create!(number: 37, size: "large", direction: "West")

      @plant_1 = Plant.create!(name: "Arugula", description: "Harvest in Winter/Spring", days_to_harvest: 140)
      @plant_2 = Plant.create!(name: "Beets", description: "Harvest all Winter", days_to_harvest: 90)
      @plant_3 = Plant.create!(name: "Carrots", description: "Harvest in Winter/Spring", days_to_harvest: 180)
      @plant_4 = Plant.create!(name: "Garlic", description: "Harvest all Summer", days_to_harvest: 80)
      @plant_5 = Plant.create!(name: "Swiss Chard", description: "Harvest in Fall/Winter", days_to_harvest: 120)
      @plant_6 = Plant.create!(name: "Turnips", description: "Harvest in Winter/Spring", days_to_harvest: 130)

      @pp_1 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_1.id)
      @pp_2 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_2.id)
      @pp_3 = PlotPlant.create!(plot_id: @plot_2.id, plant_id: @plant_3.id)
      @pp_4 = PlotPlant.create!(plot_id: @plot_2.id, plant_id: @plant_4.id)
      @pp_5 = PlotPlant.create!(plot_id: @plot_3.id, plant_id: @plant_2.id)
      @pp_6 = PlotPlant.create!(plot_id: @plot_3.id, plant_id: @plant_4.id)
    end

    it "can find the unique plants harvestable in less than 100 days" do
      expect(@garden_1.quicker_harvest_plants).to eq([@plant_2, @plant_4])
    end
  end
end