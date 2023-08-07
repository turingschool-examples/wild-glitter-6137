require 'rails_helper'

RSpec.describe "Plots Index Page", type: :feature do
  before(:each) do 
    @garden1 = Garden.create!(name: "Stardew Garden", organic: true)

    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 15, size: "Small", direction: "West")

    @plant1 = @plot1.plants.create!(name: "Starfruit", description: "A fruit that grows in hot, humid weather", days_to_harvest: 90)
    @plant2 = @plot1.plants.create!(name: "Kale", description: "Great in soups and stir frys", days_to_harvest: 105)
    @plant5 = @plot1.plants.create!(name: "Parsnip", description: "Has an earthy taste", days_to_harvest: 50)

    @plant3 = @plot2.plants.create!(name: "Parsnip", description: "Has an earthy taste", days_to_harvest: 50)
    @plant4 = @plot2.plants.create!(name: "Hops", description: "Used to flavor beer", days_to_harvest: 110)
  end
  scenario "I see a list of all plot numbers and plant names for those plots" do 
    visit plots_path
    
    expect(page).to have_content("Plot Number: #{@plot1.number}")
    @plot1.plants.each do |plant|
      expect(page).to have_content("Plant Name: #{plant.name}")
    end

    expect(page).to have_content("Plot Number: #{@plot2.number}")
    @plot2.plants.each do |plant|
      expect(page).to have_content("Plant Name: #{plant.name}")
    end
  end

  # scenaro "Next to each plant name I see a link to remove the plant from plot but its still associated with other plots" do 
  #   visit plots_path 

  # end
end