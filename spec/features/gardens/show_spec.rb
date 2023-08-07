require "rails_helper"

RSpec.describe "Garden Show Page", type: :feature do
  before :each do
    # Gardens
    @garden_a = Garden.create!(name: "Ethan's Test Garden", organic: true)
    @garden_b = Garden.create!(name: "Ethan CORP Industrial Garden", organic: false)
    
    # Plots
    @plot_a1 = @garden_a.plots.create!(number: 1, size: "Medium", direction: "West")
    @plot_a2 = @garden_a.plots.create!(number: 2, size: "Small", direction: "East")
    
    @plot_b1 = @garden_b.plots.create!(number: 1, size: "Large", direction: "North")
    
    # Plants
    @plant_1 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 50)
    @plant_2 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 80)
    @plant_3 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 90)
    @plant_4 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 100)

    # Add plants to plots
    @plot_a1_plant_1 = PlotPlant.create!(plot_id: @plot_a1.id, plant_id: @plant_1.id)
    @plot_a1_plant_2 = PlotPlant.create!(plot_id: @plot_a1.id, plant_id: @plant_2.id)
    @plot_a1_plant_3 = PlotPlant.create!(plot_id: @plot_a1.id, plant_id: @plant_3.id)

    @plot_a2_plant_2 = PlotPlant.create!(plot_id: @plot_a2.id, plant_id: @plant_2.id)
    @plot_a2_plant_3 = PlotPlant.create!(plot_id: @plot_a2.id, plant_id: @plant_3.id)
    @plot_a2_plant_4 = PlotPlant.create!(plot_id: @plot_a2.id, plant_id: @plant_4.id)

    @plot_b1_plant_3 = PlotPlant.create!(plot_id: @plot_b1.id, plant_id: @plant_3.id)
    @plot_b1_plant_4 = PlotPlant.create!(plot_id: @plot_b1.id, plant_id: @plant_4.id)
  end

  it "it has a list of unique plants included in that garden's plots that take less than 100 days to harvest" do
    visit garden_path(@garden_a)

    within("#garden-unique-plants") do
      # Plant 1 appears once in Garden A, in Plot 1
      expect(page).to have_content(@plant1.name).once

      # Plants 2 and 3 appear twice in Garden A, once each in Plots 1 and 2
      expect(page).to have_content(@plant2.name).once
      expect(page).to have_content(@plant3.name).once

      # Plant 4 takes 100 days to harvest, so it should not appear on the page
      expect(page).to_not have_content(@plant4.name)
    end
  end
end