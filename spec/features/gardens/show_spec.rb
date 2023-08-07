require 'rails_helper'

RSpec.describe "Gardens Show Page", type: :feature do
  before(:each) do 
    @garden1 = Garden.create!(name: "Stardew Garden", organic: true)

    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 15, size: "Small", direction: "West")
    
    @plant5 = @plot1.plants.create!(name: "Parsnip", description: "Has an earthy taste", days_to_harvest: 50)
    @plant1 = @plot1.plants.create!(name: "Starfruit", description: "A fruit that grows in hot, humid weather", days_to_harvest: 90)
    @plant2 = @plot1.plants.create!(name: "Kale", description: "Great in soups and stir frys", days_to_harvest: 105)

    @plant3 = @plot2.plants.create!(name: "Parsnip", description: "Has an earthy taste", days_to_harvest: 50)
    @plant4 = @plot2.plants.create!(name: "Hops", description: "Used to flavor beer", days_to_harvest: 110)

    visit garden_path(@garden1)
  end

  scenario "I see a unique list of plants that are in that gardens plot, and this list only includes plants that harvest in less than 100 days" do 

    expect(page).to have_content('Parsnip').once
    expect(page).to have_content(@plant1.name)
  end
end