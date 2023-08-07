require "rails_helper"

RSpec.describe "The Plots Index", type: :feature do
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
  end
end