require 'rails_helper' 

RSpec.describe "Garden's Show Page" do
  before(:each) do
    @garden = Garden.create!(name: "Wild Flowers", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Medium", direction: "East")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "West")

    @plant1 = Plant.create!(name: "New England Aster", description: "Perennial salt-tolerant plant", days_to_harvest: 10)
    @plant2 = Plant.create!(name: "Blanket Flowers", description: "Plains Wildflower", days_to_harvest: 180)
    @plant3 = Plant.create!(name: "Queen Anne's Lace", description: "Related to carrots and smells like carrots", days_to_harvest: 14)
    @plant4 = Plant.create!(name: "Bachelor Buttons", description: "They used to be used in place of buttonhold of a suit", days_to_harvest: 101)

    # Plot 1
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)

    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant2.id)
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant3.id)
    # Plot 2
    PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant1.id)
    PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant2.id)
    PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant4.id)

    visit garden_path(@garden)
  end

  describe "as a visitor" do
    describe "when I visit a garden's show page ('/gardens/:id')" do
      # User Story 3
      it "then I see a list of plants that are included in that garden's plots, and I see that this list is unique (no duplicate plants),and I see that this list only includes plants that take less than 100 days to harvest" do
        expect(page).to have_content(@garden.name)
        
        within("#plant-list") do
          expect(page).to have_content("Flowers with Less Than 100 Days to Harvest")
          expect(page).to have_content(@plant1.name)
          expect(page).to have_content(@plant3.name)
          expect(page).to_not have_content(@plant2.name)
          expect(page).to_not have_content(@plant4.name)
        end
      end

      # Extension 1
      it "Then I see the list of plants is sorted by the number of times the plant appears in any of that garden's plots from most to least
      (Note: you should only make 1 database query to retrieve the sorted list of plants)" do
        expect(page).to have_content("List of Flowers in #{@garden.name} Garden")
        within("#sorted-list") do # in order of appearance
          expect(page).to have_content("New England Aster")
          expect(page).to have_content("Blanket Flowers")
          expect(page).to have_content("Bachelor Buttons")
          expect(page).to have_content("Queen Anne's Lace")
        end
      end
    end
  end
end