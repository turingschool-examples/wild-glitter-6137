require "rails_helper"

RSpec.describe "plots index page" do
  before(:each) do
    @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden_2 = Garden.create!(name: "Dads Catus Garden", organic: false)
    @plot_1 = @garden_1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @garden_2.plots.create!(number: 13, size: "Small", direction: "South")
    @plant_1 = @plot_1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = @plot_2.plants.create!(name: "Barrel Cactus", description: "Prefers dry dirt.", days_to_harvest: 600)
    @plant_3 = Plant.create!(name: "Palm Tree", description: "Rain Forrest.", days_to_harvest: 50)
  end
  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see the names of all that plot's plants
    describe "When I visit the plots index page" do
      it "I see a list of all plot numbers, And under each plot number I see the names of all that plot's plants" do
        visit plots_path
    
        expect(page).to have_content(@plot_1.number)
        expect(page).to have_content(@plant_1.name)
        expect(page).to have_content(@plot_2.number)
        expect(page).to have_content(@plant_2.name)
        
      end

  end
end 