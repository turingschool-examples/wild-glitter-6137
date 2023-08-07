require 'rails_helper'

RSpec.describe "The Gardens Show page" do
  before(:each) do
    @g1 = Garden.create!(name: "Fertilizer Spaceship", organic: true)
    @v1 = Plant.create!(name: "Potato", description: "spud", days_to_harvest: 22)
    @v2 = Plant.create!(name: "Carrot", description: "orange spike", days_to_harvest: 33)
    @v3 = Plant.create!(name: "Rhubarb", description: "red celery", days_to_harvest: 44)
    @v4 = Plant.create!(name: "Tomato", description: "red berry", days_to_harvest: 101)
    @p1 = Plot.create!(number: 1, size: "large", direction: "north", garden: @g1)
    @p2 = Plot.create!(number: 2, size: "medium", direction: "south", garden: @g1)
    PlotPlant.create!(plot: @p1, plant: @v1)
    PlotPlant.create!(plot: @p2, plant: @v2)
    PlotPlant.create!(plot: @p1, plant: @v3)
    PlotPlant.create!(plot: @p2, plant: @v3)
  end

  it "shows all unique plants with less than 100 days to harvest" do
    visit garden_path(@g1)

    expect(page).to have_content(@g1.name)
    expect(page).to have_content("Plants in this Garden:")
    expect(page).to have_content(@v1.name)
    expect(page).to have_content(@v2.name)
    expect(page).to have_content(@v3.name)
    expect(page).not_to have_content(@v4.name)
  end
end