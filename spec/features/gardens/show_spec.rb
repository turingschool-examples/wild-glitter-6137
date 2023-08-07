require "rails_helper"

RSpec.describe "plots index page" do
  before(:each) do
    @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden_2 = Garden.create!(name: "Dads Catus Garden", organic: false)
    @plot_1 = @garden_1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @garden_2.plots.create!(number: 13, size: "Small", direction: "South")
    @plant_1 = @plot_1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = @plot_2.plants.create!(name: "Barrel Cactus", description: "Prefers dry dirt.", days_to_harvest: 600)
    @plant_3 = @plot_1.plants.create!(name: "Palm Tree", description: "Rain Forrest.", days_to_harvest: 50)
    @plant_2 = @plot_1.plants.create!(name: "Barrel Cactus", description: "Prefers dry dirt.", days_to_harvest: 600)
  end
#  As a visitor
# When I visit a garden's show page ('/gardens/:id')
# Then I see a list of plants that are included in that garden's plots
# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take less than 100 days to harvest
    describe "When I visit a garden's show page ('/gardens/:id')" do
      it "Then I see a list of plants that are included in that garden's plots" do
        visit "/gardens/#{@garden_1.id}"


        expect(page).to have_content(@plant_1.name)
        expect(page).to have_content(@plant_3.name)
        expect(page).not_to have_content(@plant_2.name)
        
      end

  end
end 