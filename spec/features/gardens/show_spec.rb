require 'rails_helper' 

RSpec.describe "Garden's Show Page" do
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

    visit garden_path(@garden)
  end

  # User Story 3
  describe "as a visitor" do
    describe "when I visit a garden's show page ('/gardens/:id')" do
      it "then I see a list of plants that are included in that garden's plots, and I see that this list is unique (no duplicate plants)," do
        within("#plant-list") do
          expect(page).to have_content(@plant1.name)
          expect(page).to have_content(@plant3.name)
        end
      end

      it "and I see that this list only includes plants that take less than 100 days to harvest" do
       # model method to find unique list of plants per plot (Plot) where harvest < 100 days
        expect(page).to have_content(@plot1.plants_with_quick_harvest)
      end
    end
  end
end