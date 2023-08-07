require 'rails_helper'

RSpec.describe 'Garden Show Page', type: :feature do
  before do
    @garden = Garden.create(name: 'Test Garden')

    @plot1 = @garden.plots.create(number: 1)
    @plot2 = @garden.plots.create(number: 2)
    @plot3 = @garden.plots.create(number: 3)

    @plant1 = Plant.create(name: 'Plant 1', description: 'Description 1', days_to_harvest: 90)
    @plant2 = Plant.create(name: 'Plant 2', description: 'Description 2', days_to_harvest: 80)
    @plant3 = Plant.create(name: 'Plant 3', description: 'Description 3', days_to_harvest: 120)

    @plot1.plants << @plant1
    @plot2.plants << @plant1
    @plot2.plants << @plant2
    @plot3.plants << @plant1
    @plot3.plants << @plant3

    visit garden_path(@garden)
  end

  it 'lists plants included in the garden plots with less than 100 days to harvest' do
    expect(page).to have_content(@garden.name)

    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).not_to have_content(@plant3.name)
  end

  it 'lists only unique plants' do
    # Assuming the same plant is added to different plots
    plants = [@plant1.name, @plant2.name]

    plants.each do |plant_name|
      expect(page).to have_text(plant_name, count: 1)
    end
  end
end