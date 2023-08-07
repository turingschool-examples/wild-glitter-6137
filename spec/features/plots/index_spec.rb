require "rails_helper"

RSpec.describe "Plots Index Page", type: :feature do
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

  it "has a list of every plot number" do
    visit plots_path

    within("#all-plots") do
      expect(page).to have_content("Plot 1").twice
      expect(page).to have_content("Plot 2").once
    end
  end

  describe "plot plants" do
    it "shows a list each plot's plants under the plot number" do
      visit plots_path

      within("#plot-#{@plot_a1.id}") do
        expect(page).to have_content(@plant_1.name).once
        expect(page).to have_content(@plant_2.name).once
        expect(page).to have_content(@plant_3.name).once
      end

      within("#plot-#{@plot_a2.id}") do
        expect(page).to have_content(@plant_2.name).once
        expect(page).to have_content(@plant_3.name).once
        expect(page).to have_content(@plant_4.name).once
      end

      within("#plot-#{@plot_b1.id}") do
        expect(page).to have_content(@plant_3.name).once
        expect(page).to have_content(@plant_4.name).once
      end
    end

    it "each plot's plant has a button near it that removes the plant from the plot" do
      visit plots_path

      within("#plot-#{@plot_a1.id}") do
        expect(page).to have_content(@plot_a1_plant_1.plant.name)
      end

      within("#plot-plant-#{@plot_a1_plant_1.id}") do
        expect(page).to have_button("Delete")

        click_button "Delete"
      end

      expect(current_path).to eq(plots_path)

      within("#plot-#{@plot_a1.id}") do
        expect(page).to_not have_content(@plot_a1_plant_1.plant.name)
      end
    end
  end
end