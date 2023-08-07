require 'rails_helper'

RSpec.describe 'the gardens show page' do

  #US 3
  describe "show page" do
    it "displays a list of the plants sorted by the number of times the plant appears in any of the plots from most to least" do
      garden1 = Garden.create!(name: "example garden", organic: true)
    
    plot1 = garden1.plots.create!(number: 1, size: "large", direction: "east")
    plot2 = garden1.plots.create!(number: 2, size: "medium", direction: "west")
    plot3 = garden1.plots.create!(number: 3, size: "small", direction: "north")

    
    plant2 = plot1.plants.create!(name: "Kale", description:
    "Leafy", days_to_harvest: 50 )
    plant3 = plot2.plants.create!(name: "Brocolli", description:
    "Leafy head", days_to_harvest: 60 )
    plant4 = plot2.plants.create!(name: "Tomatillo", description:
    "Fruit", days_to_harvest: 80 )
    plant5 = plot3.plants.create!(name: "Grape", description:
    "Fruit vine", days_to_harvest: 100 )
    plant1 = plot1.plants.create!(name: "Tomato", description:
    "Fruit not vegetable", days_to_harvest: 75 )

    plant_plot1 = PlantPlot.create!(plant: plant1, plot: plot2)
    plant_plot2 = PlantPlot.create!(plant: plant1, plot: plot3)
    plant_plot3 = PlantPlot.create!(plant: plant5, plot: plot2)
  

    visit garden_path(garden1)
    #save_and_open_page
    expect(page).to have_content("Tomato - Occurrences: 3")
    expect(page).to have_content("Grape - Occurrences: 2")
    end
  end
end