require 'rails_helper'

RSpec.describe "/plots" do
  before do
    @brave = Garden.create(name: "Brave Harvest", organic: true)
    @plot_1 = @brave.plots.create(number: 1, size: "Medium", direction: "North")
    @plot_2 = @brave.plots.create(number: 2, size: "Small", direction: "East")
    @tomato = Plant.create(name: "Tomato", description: "Red", days_to_harvest: 40)
    @bell = Plant.create(name: "Bell Pepper", description: "Tasty", days_to_harvest: 20)
    @eggplant = Plant.create(name: "Eggplant", description: "Purple", days_to_harvest: 30)
    @plant_plot_1 = PlantPlot.create(plant: @tomato, plot: @plot_1)
    @plant_plot_2 = PlantPlot.create(plant: @bell, plot: @plot_1)
    @plant_plot_3 = PlantPlot.create(plant: @bell, plot: @plot_2)
    @plant_plot_4 = PlantPlot.create(plant: @eggplant, plot: @plot_2)
  end

  describe "When I visit the plots index page" do
    it "I see a list of all plot numbers" do
      visit "/plots"

      expect(page).to have_content("Plots")

      within "#plot-#{@plot_1.id}" do
        expect(page).to have_content("Plot Number: #{@plot_1.number}")
      end
      
      within "#plot-#{@plot_2.id}" do
        expect(page).to have_content("Plot Number: #{@plot_2.number}")
      end
    end

    it "under each plot number I see the names of all that plot's plants" do
      visit "/plots"

      within "#plot-#{@plot_1.id}" do
        expect(page).to have_content("Plants: #{@tomato.name}")
        expect(page).to have_content("Plants: #{@bell.name}")
        expect(page).to_not have_content("Plants: #{@eggplant.name}")
      end
      
      within "#plot-#{@plot_2.id}" do
        expect(page).to have_content("Plants: #{@bell.name}")
        expect(page).to have_content("Plants: #{@eggplant.name}")    
        expect(page).to_not have_content("Plants: #{@tomato.name}")    
      end
    end

    it "I see a button to remove the plant from that plot" do
      visit "/plots"
      
      within "#plot-#{@plot_2.id}" do
        expect(page).to have_content("Plants:")
        expect(page).to have_content("#{@bell.name}")
        expect(page).to have_button("Remove Plant #{@bell.id}")
        expect(page).to have_content("#{@eggplant.name}")
        expect(page).to have_button("Remove Plant #{@eggplant.id}")

        click_button("Remove Plant #{@bell.id}")
      end

      expect(current_path).to eq("/plots")
      
      within "#plot-#{@plot_2.id}" do
        expect(page).to have_content("Plants:")

        expect(page).to_not have_content("#{@bell.name}")
        expect(page).to_not have_button("Remove Plant #{@bell.id}")
        expect(page).to have_content("#{@eggplant.name}")
        expect(page).to have_button("Remove Plant #{@eggplant.id}")
      end
    end
  end
end