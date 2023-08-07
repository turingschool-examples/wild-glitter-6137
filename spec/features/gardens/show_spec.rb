require "rails_helper"

describe "Gardens show page" do
  before(:each) do
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

    visit garden_path(@garden_1.id)
  end
  describe "As a visitor When I visit a garden's show page ('/gardens/:id')" do
    it "US3.a Then I see a list of plants that are included in that garden's plots And I see that this list is unique (no duplicate plants)" do
      expect(page).to have_content(@plant_1.id, count: 1)
      expect(page).to have_content(@plant_2.id, count: 1)
      expect(page).to have_content(@plant_3.id, count: 1)
    end
    it "US3.b And I see that this list only includes plants that take less than 100 days to harvest" do
      expect(page).to_not have_content(@plant_6.id)
      expect(page).to_not have_content(@plant_7.id)
    end
  end
end