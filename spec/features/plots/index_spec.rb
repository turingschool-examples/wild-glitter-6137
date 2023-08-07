require "rails_helper"

RSpec.describe "Plots Index Page", type: :feature do
  before :each do
    # Gardens
    @garden_a = Garden.create!(name: "Ethan's Test Garden", organic: true)
    @garden_b = Garden.create!(name: "Ethan CORP Industrial Garden", organic: false)
    
    # Plots
    @plot_1a = @garden_a.plots.create!(number: 1, size: "Medium", direction: "West")
    @plot_2a = @garden_a.plots.create!(number: 2, size: "Small", direction: "East")
    
    @plot_1b = @garden_b.plots.create!(number: 1, size: "Large", direction: "North")
    
    # Plants
    @plant_1 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 50)
    @plant_2 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 80)
    @plant_3 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 90)
    @plant_4 = Plant.create!(name: Faker::Food.unique.vegetables, description: Faker::Quotes::Shakespeare.hamlet_quote, days_to_harvest: 100)

    # Add plants to plots
    @plot_1a.plants << @plant_1
    @plot_1a.plants << @plant_2
    @plot_1a.plants << @plant_3

    @plot_2a.plants << @plant_2
    @plot_2a.plants << @plant_3
    @plot_2a.plants << @plant_4

    @plot_1b.plants << @plant_3
    @plot_1b.plants << @plant_4
  end

  it "has a list of every plot number" do
  end
end