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
    @plot_a1.plants << @plant_1
    @plot_a1.plants << @plant_2
    @plot_a1.plants << @plant_3

    @plot_a2.plants << @plant_2
    @plot_a2.plants << @plant_3
    @plot_a2.plants << @plant_4

    @plot_b1.plants << @plant_3
    @plot_b1.plants << @plant_4
  end

  it "has a list of every plot number" do
    visit plots_path

    within("#all-plots") do
      expect(page).to have_content("Plot 1").twice
      expect(page).to have_content("Plot 2").once
    end
  end

  it "shows a list each plot's plant under the plot number" do
    visit plots_path

    within("#plot-#{plot_a1.id}") do
      expect(page).to have_content(@plant_1.name).once
      expect(page).to have_content(@plant_2.name).once
      expect(page).to have_content(@plant_3.name).once
    end

    within("#plot-#{plot_a2.id}") do
      expect(page).to have_content(@plant_2.name).once
      expect(page).to have_content(@plant_3.name).once
      expect(page).to have_content(@plant_4.name).once
    end

    within("#plot-#{plot_b1.id}") do
      expect(page).to have_content(@plant_3.name).once
      expect(page).to have_content(@plant_4.name).once
    end
  end
end