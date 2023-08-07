require "rails_helper"

describe "Plots index page" do
  before(:each) do
    @garden_1 = Garden.create!(name: "Rosie's Organic Gardens", organic: true)
    @garden_2 = Garden.create!(name: "Thornton Community Garden", organic: false)

    @plot_1 = Plot.create!(number: "1", size: "small", direction: "north", garden_id: @garden_1.id)
    @plot_2 = Plot.create!(number: "2", size: "small", direction: "north", garden_id: @garden_1.id)
    @plot_3 = Plot.create!(number: "3", size: "small", direction: "north", garden_id: @garden_1.id)
    @plot_4 = Plot.create!(number: "100", size: "medium", direction: "west", garden_id: @garden_2.id)
    @plot_5 = Plot.create!(number: "101", size: "large", direction: "south", garden_id: @garden_2.id)
    @plots = [@plot_1, @plot_2, @plot_3, @plot_4, @plot_5]

    @plant_1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90 )
    @plant_2 = Plant.create!(name: "Ruby Red Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 85 )
    @plant_3 = Plant.create!(name: "Orange Sun Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 95 )
    @plant_4 = Plant.create!(name: "Jalapeno Pepper", description: "Dry or humid, hot or cool climates.", days_to_harvest: 72 )
    @plant_5 = Plant.create!(name: "Tabasco Pepper", description: "Produces continuously in all areas of US.", days_to_harvest: 80 )
    @plant_6 = Plant.create!(name: "Ghost Pepper", description: "Wear gloves and long sleeves.  Avoid skin contact.", days_to_harvest: 100 )
    @plant_7 = Plant.create!(name: "Ghost Pepper", description: "Wear gloves and long sleeves.  Avoid skin contact.", days_to_harvest: 100 )
    @plant_8 = Plant.create!(name: "Cayenne Pepper", description: "Harvest when 5-6 inches long.", days_to_harvest: 85 )
    @plants = [@plant_1, @plant_2, @plant_3, @plant_4, @plant_5, @plant_6, @plant_7, @plant_8]

    @pp_1 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_1.id)
    @pp_2 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_2.id)
    @pp_3 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_3.id)
    @pp_4 = PlotPlant.create!(plot_id: @plot_2.id, plant_id: @plant_4.id)
    @pp_5 = PlotPlant.create!(plot_id: @plot_2.id, plant_id: @plant_5.id)
    @pp_6 = PlotPlant.create!(plot_id: @plot_3.id, plant_id: @plant_6.id)
    @pp_7 = PlotPlant.create!(plot_id: @plot_4.id, plant_id: @plant_7.id)
    @pp_8 = PlotPlant.create!(plot_id: @plot_5.id, plant_id: @plant_8.id)
  end
  describe "As a visitor" do
    describe "when I visit the plots index page ('/plots')" do
      it "I see a list of all plot numbers And under each plot number I see the names of all that plot's plants" do
        visit "/plots"
        
        expect(page).to have_content("All Plots")
        @plots.each do |plot|
          expect(page).to have_content(plot.number)
          plot.plants.each do |plant|
            expect(page).to have_content(plant.name)
          end
        end
      end
    end
  end
end