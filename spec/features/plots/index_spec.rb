require "rails_helper"

RSpec.describe "The Plots", type: :feature do
  before :each do
    test_data
  end

  describe "#index page" do
    it "displays list of plot numbers and under each a list of plant names associated with plot" do
      visit plots_path
      
      Plot.all.each do |plot|
        expect(page).to have_content(plot.number)
        plot.plants.each do |plant|
          expect(page).to have_content(plant.name)
        end
      end
    end

    it "displays button to Remove plant from plot, but not delete the plant from other plots" do
      visit plots_path

      Plot.all.each do |plot|
        plot.plants.each do |plant|
          expect(page).to have_button("Remove")
        end
      end
    
      within ".plot[plot-id='#{@plot_1.id}']" do
        expect(page).to have_content("Hydnora")
    
        hydnora = find(".plant[plant-id='#{@plant_1.id}']")
        within hydnora do
          click_button "Remove"
        end
      end
      
      expect(current_path).to eq(plots_path)

      within ".plot[plot-id='#{@plot_1.id}']" do
        expect(page).to_not have_content("Hydnora")
      end

      within ".plot[plot-id='#{@plot_6.id}']" do
        expect(page).to have_content("Hydnora")
      end
    end
  end
end