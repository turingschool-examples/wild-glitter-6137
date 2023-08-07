require "rails_helper"

RSpec.describe "Gardens show page" do
  before do
    @garden = Garden.create!(name: "Community Garden", organic: true)

    @plot_1 = @garden.plots.create!(number: 1, size: "Small", direction: "South")
    @plot_2 = @garden.plots.create!(number: 2, size: "Medium", direction: "East")
    @plot_3 = @garden.plots.create!(number: 3, size: "Large", direction: "West")
    @plot_4 = @garden.plots.create!(number: 4, size: "Small", direction: "North")
    @plot_5 = @garden.plots.create!(number: 5, size: "Medium", direction: "South-East")

    @pepper = Plant.create!(name: "Black Pearl Pepper", description: "Partial to full sun, good drainage", days_to_harvest: 120)
    @chard = Plant.create!(name: "Bright Lights Swiss Chard", description: "Full sun, good drainage", days_to_harvest: 60)
    @broccoli = Plant.create!(name: "Romanesco Broccoli", description: "Partial shade, alkaline soil", days_to_harvest: 100)
    @squash = Plant.create!(name: "Turban Squash", description: "Full sun, good drainage", days_to_harvest: 100)
    @carrot = Plant.create!(name: "Purple Haze Carrot", description: "Full sun, average water needs", days_to_harvest: 70)
    @bean = Plant.create!(name: "Purple Hyacinth Bean", description: "Full sun, loamy soil, keep moist", days_to_harvest: 90)

    PlotPlant.create!(plot: @plot_1, plant: @pepper)
    PlotPlant.create!(plot: @plot_1, plant: @chard)
    PlotPlant.create!(plot: @plot_1, plant: @squash)
    PlotPlant.create!(plot: @plot_1, plant: @carrot)
    PlotPlant.create!(plot: @plot_1, plant: @bean)

    PlotPlant.create!(plot: @plot_2, plant: @chard)
    PlotPlant.create!(plot: @plot_2, plant: @carrot)
    PlotPlant.create!(plot: @plot_2, plant: @bean)

    PlotPlant.create!(plot: @plot_3, plant: @pepper)
    PlotPlant.create!(plot: @plot_3, plant: @squash)

    PlotPlant.create!(plot: @plot_4, plant: @broccoli)
    PlotPlant.create!(plot: @plot_4, plant: @pepper)

    PlotPlant.create!(plot: @plot_5, plant: @pepper)
    PlotPlant.create!(plot: @plot_5, plant: @carrot)
    PlotPlant.create!(plot: @plot_5, plant: @bean)
  end

  #User story 3
  it "has a unique list of plants that mature in less that 100 days growing in this garden's plots" do
    visit garden_path(@garden)

    expect(page).to have_content("Community Garden Plants")
    expect(page).to have_content("Plants That Mature In Less Than 100 Days")

    expect(page).to have_content("Bright Lights Swiss Chard").once
    expect(page).to have_content("Purple Haze Carrot").once
    expect(page).to have_content("Purple Hyacinth Bean").once
    expect(page).to_not have_content("Black Pearl Pepper")
    expect(page).to_not have_content("Romanesco Broccoli")
    expect(page).to_not have_content("Turban Squash")
    save_and_open_page
  end
end