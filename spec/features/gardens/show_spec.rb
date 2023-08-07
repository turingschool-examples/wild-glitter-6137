require "rails_helper"

describe "plots index" do
  before :each do
    @garden_1 = Garden.create!(name: "Garden Variety", organic: true)
    @garden_2 = Garden.create!(name: "Monocrop City", organic: false)
    
    @plot_1 = @garden_1.plots.create!(number: 10, size: "Small", direction: "North")
    @plot_2 = @garden_1.plots.create!(number: 20, size: "Medium", direction: "East")
    @plot_3 = @garden_2.plots.create!(number: 25, size: "Medium", direction: "South")
    @plot_4 = @garden_2.plots.create!(number: 50, size: "Large", direction: "West")
    @plot_5 = @garden_1.plots.create!(number: 5, size: "Micro", direction: "West")

    @plant_1 = Plant.create!(name: "Wild Iris", description: "Delicate and beautiful", days_to_harvest: 120)
    @plant_2 = Plant.create!(name: "Rose", description: "Thorny", days_to_harvest: 50)
    @plant_3 = Plant.create!(name: "Sunflower", description: "Brightens up any place!", days_to_harvest: 40)
    @plant_4 = Plant.create!(name: "Aloe", description: "Soothing", days_to_harvest: 30)
    @plant_5 = Plant.create!(name: "Monstera", description: "Low light plant", days_to_harvest: 20)
    @plant_6 = Plant.create!(name: "Hanging Vine", description: "Spindly vines", days_to_harvest: 10)

    @plant_plot_1 = PlantPlot.create!(plant_id: @plant_1.id, plot_id: @plot_1.id)
    @plant_plot_2 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_1.id)
    @plant_plot_3 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_2.id)
    @plant_plot_4 = PlantPlot.create!(plant_id: @plant_3.id, plot_id: @plot_2.id)
    @plant_plot_5 = PlantPlot.create!(plant_id: @plant_3.id, plot_id: @plot_3.id)
    @plant_plot_6 = PlantPlot.create!(plant_id: @plant_4.id, plot_id: @plot_3.id)
    @plant_plot_7 = PlantPlot.create!(plant_id: @plant_4.id, plot_id: @plot_4.id)
    @plant_plot_8 = PlantPlot.create!(plant_id: @plant_1.id, plot_id: @plot_4.id)
    @plant_plot_9 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_5.id)
    @plant_plot_10 = PlantPlot.create!(plant_id: @plant_1.id, plot_id: @plot_5.id)

    visit garden_path(@garden_1)
  end

  it "shows a unique list of all plants included in the garden's plots that take less than 100 days to harvest" do
    within "#early_harvest" do
      expect(page).to have_content(@plant_2.name)
      expect(page).to have_content(@plant_3.name)
      expect(page).to_not have_content(@plant_4.name)
      expect(page).to_not have_content(@plant_2.name).twice
      expect(page).to_not have_content(@plant_1.name)
    end
  end

  it "shows plants in order of highest to lowest quantity in the garden" do
    within "#ordered_plants" do
      expect(@plant_2.name).to appear_before(@plant_1.name)
      expect(@plant_1.name).to appear_before(@plant_3.name)
    end
  end
end
