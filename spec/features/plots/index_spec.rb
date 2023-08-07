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
end