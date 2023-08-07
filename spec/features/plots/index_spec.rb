require 'rails_helper'

RSpec.describe 'the plot index page' do
  describe "US 1 & 2" do
    
  end

    #US 1
  it "displays all of the plots and the plants associtated" do

    garden1 = Garden.create!(name: "example garden", organic: true)
    
    plot1 = garden1.plots.create!(number: 1, size: "large", direction: "east")
    plot2 = garden1.plots.create!(number: 2, size: "medium", direction: "west")
    plot3 = garden1.plots.create!(number: 3, size: "small", direction: "north")

    plant1 = plot1.plants.create!(name: "Tomato", description:
    "Fruit not vegetable", days_to_harvest: 75 )
    plant2 = plot1.plants.create!(name: "Kale", description:
    "Leafy", days_to_harvest: 50 )
    plant3 = plot2.plants.create!(name: "Brocolli", description:
    "Leafy head", days_to_harvest: 60 )
    plant4 = plot2.plants.create!(name: "Tomatillo", description:
    "Fruit", days_to_harvest: 80 )
    plant5 = plot3.plants.create!(name: "Grape", description:
    "Fruit vine", days_to_harvest: 100 )

    visit "/plots"

    expect(current_path).to eq("/plots")

    expect(page).to have_content("Brocolli")
    expect(page).to have_content("Kale")
    
  end

    #US 2
  it "Can remove the association between a plant and a plot" do

    garden1 = Garden.create!(name: "example garden", organic: true)
    
    plot1 = garden1.plots.create!(number: 1, size: "large", direction: "east")
    plot2 = garden1.plots.create!(number: 2, size: "medium", direction: "west")
    plot3 = garden1.plots.create!(number: 3, size: "small", direction: "north")

    plant1 = plot1.plants.create!(name: "Tomato", description:
    "Fruit not vegetable", days_to_harvest: 75 )
    plant2 = plot1.plants.create!(name: "Kale", description:
    "Leafy", days_to_harvest: 50 )
    plant3 = plot2.plants.create!(name: "Brocolli", description:
    "Leafy head", days_to_harvest: 60 )
    plant4 = plot2.plants.create!(name: "Tomatillo", description:
    "Fruit", days_to_harvest: 80 )
    plant5 = plot3.plants.create!(name: "Grape", description:
    "Fruit vine", days_to_harvest: 100 )    
    
    visit "/plots"
    expect(page).to have_content("Tomato")
    expect(page).to have_button("Remove Tomato from plot #1")
    click_button("Remove Tomato from plot #1")

    expect(page).to_not have_content("Tomato")
  end
end