require "rails_helper"

RSpec.describe "plots index page" do

  it "displays all plot numbers and their plants" do
    garden_1 = Garden.create!(name: "botanic gardens", organic: true) 
    plot_1 = garden_1.plots.create!(number: 1, size: "small", direction: "west")
    plant_1 = Plant.create!(name: "rose", description: "red", days_to_harvest: 15)
    plant_2 = Plant.create!(name: "cactus", description: "green", days_to_harvest: 25)
    plant_plot1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
    plant_plot2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_1.id)
    
    plot_2 = garden_1.plots.create!(number: 2, size: "medium", direction: "east")
    plant_3 = Plant.create!(name: "daff", description: "yellow", days_to_harvest: 5)
    plant_4 = Plant.create!(name: "green", description: "green", days_to_harvest: 5)
    plant_plot3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_2.id)
    plant_plot4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_2.id)
    
    visit plots_path

    expect(page).to have_content(plot_1.number)
    expect(page).to have_content(plant_1.name)
    expect(page).to have_content(plant_2.name)
  
    expect(page).to have_content(plot_2.number)
    expect(page).to have_content(plant_3.name)
    expect(page).to have_content(plant_4.name)
  end

  it "has a link to delete plants from plots" do
    garden_1 = Garden.create!(name: "botanic gardens", organic: true) 
    plot_1 = garden_1.plots.create!(number: 1, size: "small", direction: "west")
    plant_1 = Plant.create!(name: "rose", description: "red", days_to_harvest: 15)
    plant_2 = Plant.create!(name: "cactus", description: "green", days_to_harvest: 25)
    plant_plot1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
    plant_plot2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_1.id)
    
    plot_2 = garden_1.plots.create!(number: 2, size: "medium", direction: "east")
    plant_3 = Plant.create!(name: "daff", description: "yellow", days_to_harvest: 5)
    plant_4 = Plant.create!(name: "green", description: "green", days_to_harvest: 5)
    plant_plot3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_2.id)
    plant_plot4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_2.id)
    plant_plot5 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_2.id)
    
    visit plots_path

  
    within(".plot-#{plot_1.id}") do
      expect(page).to have_button("Delete #{plant_1.name}")
      click_button "Delete #{plant_1.name}"
      expect(current_path).to eq(plots_path)
      expect(page).to_not have_content(plant_1.name)
    end
    expect(page).to have_content(plant_1.name)
  end
end