require 'rails_helper'

RSpec.feature 'Gardens Show Page', type: :feature do
  scenario "visitor can see a unique list of plants in each garden plot" do
    @garden = Garden.create!(name: 'Backstreet Garden', organic: true)
    @plot1 = Plot.create!(number: 1, size: 'Large', direction: 'North', garden: @garden)
    @plot2 = Plot.create!(number: 2, size: 'Small', direction: 'East', garden: @garden)
    @plant1 = Plant.create!(name: 'Tomato', description: 'Tasty', days_to_harvest: 100)
    @plant2 = Plant.create!(name: 'Lettuce', description: 'Crunchy', days_to_harvest: 99)
    @plant3 = Plant.create!(name: 'Carrot', description: 'Crunchy', days_to_harvest: 30)
    @plot1.plants << @plant1
    @plot1.plants << @plant2
    @plot2.plants << @plant2
    @plot2.plants << @plant3

    visit garden_path(@garden)

    expect(page).to_not have_content(@plant1.name)
    expect(page).to have_content(@plant2.name).once
    expect(page).to have_content(@plant3.name)
  end
end
