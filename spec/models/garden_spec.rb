require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe '.plants_list' do
    it "should return a unique list of plants for this garden" do
      @garden_1 = Garden.create!(name: "Rosie's Organic Gardens", organic: true)

      @plot_1 = Plot.create!(number: "1", size: "small", direction: "north", garden_id: @garden_1.id)
      @plot_2 = Plot.create!(number: "2", size: "small", direction: "north", garden_id: @garden_1.id)
      @plot_3 = Plot.create!(number: "3", size: "small", direction: "north", garden_id: @garden_1.id)
      @plots = [@plot_1, @plot_2, @plot_3]

      @plant_1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90 )
      @plant_2 = Plant.create!(name: "Ruby Red Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 85 )
      @plant_3 = Plant.create!(name: "Orange Sun Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 95 )
      @plant_4 = Plant.create!(name: "Jalapeno Pepper", description: "Dry or humid, hot or cool climates.", days_to_harvest: 72 )
      @plant_5 = Plant.create!(name: "Tabasco Pepper", description: "Produces continuously in all areas of US.", days_to_harvest: 80 )
      @plant_6 = Plant.create!(name: "Ghost Pepper", description: "Wear gloves and long sleeves.  Avoid skin contact.", days_to_harvest: 100 )
      @plant_7 = Plant.create!(name: "Ghost Pepper", description: "Wear gloves and long sleeves.  Avoid skin contact.", days_to_harvest: 100 )
      @plant_8 = Plant.create!(name: "Cayenne Pepper", description: "Harvest when 5-6 inches long.", days_to_harvest: 85 )

      @pp_1 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_1.id)
      @pp_2 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_2.id)
      @pp_3 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_3.id)
      @pp_4 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_1.id)
      @pp_5 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_2.id)
      @pp_6 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_6.id)
      @pp_7 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_7.id)

      expect(@garden_1.plants_list).to eq([@plant_1, @plant_2, @plant_3])
    end
  end
end