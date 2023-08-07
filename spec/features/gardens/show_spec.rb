require 'rails_helper'

RSpec.describe 'Garden Show Page', type: :feature do
  before do
    @garden = Garden.create(name: 'Test Garden')

    @plot1 = @garden.plots.create(number: 1)
    @plot2 = @garden.plots.create(number: 2)
    @plot3 = @garden.plots.create(number: 3)

    @plant1 = Plant.create(name: 'Plant 1', description: 'Description 1', days_to_harvest: 90)
    @plant2 = Plant.create(name: 'Plant 2', description: 'Description 2', days_to_harvest: 80)

    @plot1.plants << @plant1
    @plot2.plants << @plant1
    @plot2.plants << @plant2

    visit garden_path(@garden)
  end

  # User Story 3, Garden's Plants

  # As a visitor
  # When I visit a garden's show page ('/gardens/:id')
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest

  it 'lists plants included in the garden plots with less than 100 days to harvest' do
    expect(page).to have_content(@garden.name)

    within('#plants-list') do
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).not_to have_content(@plant3.name)
    end
  end

  it 'lists only unique plants' do
    # Assuming the same plant is added to different plots
    expect(page).to have_selector('#plants-list li', count: 2)
  end


end