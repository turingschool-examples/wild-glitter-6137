require "rails_helper"

RSpec.describe Plot do
  before do
    @garden_1 = Garden.create!(name: "Portland Communtiy Garden", organic: true)

    @plot_1 = @garden_1.plots.create!(number: 1, size: "Small", direction: "East")
    @plot_2 = @garden_1.plots.create!(number: 2, size: "Medium", direction: "West")
    @plot_3 = @garden_1.plots.create!(number: 3, size: "Large", direction: "North")

    @plant_1 = Plant.create!(name: "Sunflower", description: " This is a sunflower", days_to_harvest: 14)
    @plant_2 = Plant.create!(name: "Tomato", description: " This is a Tomato", days_to_harvest: 24)
    @plant_3 = Plant.create!(name: "Watermelon", description: " This is a Watermelon", days_to_harvest: 34)
    @plant_4 = Plant.create!(name: "Cucumber", description: " This is a Cucumber", days_to_harvest: 15)

    @plot_1.plants << @plant_1
    @plot_2.plants << @plant_2
    @plot_3.plants << @plant_3

  end

  #User Story 1, Plots Index Page

  describe "As a visitor" do
    describe "When I visit the plots index page ('/plots')" do
      describe "I see a list of all plot numbers" do
        it "And under each plot number I see the names of all that plot's plants" do
          visit "/plots"

          expect(page).to have_content(@plot_1.number)
          expect(page).to have_content(@plant_1.name)

          expect(page).to have_content(@plot_2.number)
          expect(page).to have_content(@plant_2.name)

          expect(page).to have_content(@plot_3.number)
          expect(page).to have_content(@plant_3.name)

        end
      end
    end
  end
end