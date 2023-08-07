require 'rails_helper'

RSpec.describe "The Plots Index page" do
  before(:each) do
    @g1 = Garden.create!(name: "Fertilizer Spaceship", organic: true)
    @v1 = Plant.create!(name: "Potato", description: "spud", days_to_harvest: 22)
    @v2 = Plant.create!(name: "Carrot", description: "orange spike", days_to_harvest: 33)
    @v3 = Plant.create!(name: "Rhubarb", description: "red celery", days_to_harvest: 44)
    @p1 = Plot.create!(number: 1, size: "large", direction: "north", garden: @g1)
    @p2 = Plot.create!(number: 2, size: "medium", direction: "south", garden: @g1)
    PlotPlant.create!(plot: @p1, plant: @v1)
    PlotPlant.create!(plot: @p2, plant: @v2)
    PlotPlant.create!(plot: @p1, plant: @v3)
    PlotPlant.create!(plot: @p2, plant: @v3)
    visit plots_path
  end

  it "renders plots and their plants" do
    expect(page).to have_content("Plots Index")
    expect(page).to have_content("Potato")
    expect(page).to have_content("Rhubarb")
    expect(page).to have_content("Carrot")
  end

  it "has a link to remove a plant from a plot" do
    expect(page).to have_button("Remove")
    within("#plot-#{@p1.id}") do
      within("#plant-#{@v3.id}") do
        click_button("Remove")
      end
    end
    expect(current_path).to eq(plots_path)
    within("#plot-#{@p1.id}") do
      expect(page).not_to have_content("Rhubarb")
    end
    within("#plot-#{@p2.id}") do
      expect(page).to have_content("Rhubarb")
    end
  end
end