require 'rails_helper' 

RSpec.describe "Plots Index Page" do
  before(:each) do
    @garden = Garden.create!(name: "Wild Flowers", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Medium", direction: "East")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "West")

    @plant1 = Plant.create!(name: "New England Aster", description: "Perennial salt-tolerant plant", days_to_harvest: 10)
    @plant2 = Plant.create!(name: "Blanket Flowers", description: "Plains Wildflower", days_to_harvest: 7)
    @plant3 = Plant.create!(name: "Queen Anne's Lace", description: "Related to carrots and smells like carrots", days_to_harvest: 14)

    
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant2.id)
    PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant3.id)

    PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant1.id)
    PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant2.id)

    visit plots_path
  end

  describe "as a visitor" do
    describe "when I visit the plots index page ('/plots')" do
      # User Story 1
      it "I see a list of all plot numbers, and under each plot number I see the names of all that plot's plants" do
        expect(page).to have_content(@plot1.number)
        expect(page).to have_content(@plot2.number)

        @plot1.plants.each do |plant|
          expect(page).to have_content(plant.name)
        end

        @plot2.plants.each do |plant|
          expect(page).to have_content(plant.name)
        end
      end

      # User Story 2
      it "next to each plant's name I see a link to remove that plant from that plot" do
        @plot1.plants.each do |plant|
          expect(page).to have_button("Remove #{plant.name}")
        end
      end

      it "when I click on that link I'm returned to the plots index page and no longer see that plant listed under that plot, and I still see that plant's name under other plots that it was assigned to" do
        expect(page).to have_content(@plant1.name)
        within("#plot-#{@plot1.id}") do
          click_on ("Remove #{@plant1.name}")
        end

        expect(page).to have_current_path(plots_path)
        within("#plot-#{@plot1.id}") do
          expect(page).not_to have_content(@plant1.name)
        end
    
        within("#plot-#{@plot2.id}") do
          expect(page).to have_content(@plant1.name)
        end
      end
    end
  end
end