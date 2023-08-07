require 'rails_helper'

RSpec.describe 'Garden Show', type: :feature do
  before :each do
    load_test_data
  end

  # User Story 3, Garden's Plants

  # As a visitor
  # When I visit a garden's show page ('/gardens/:id')
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest

  it 'displays a list of plants that are included in that gardens plots and are unique and take less than 100 days to harvest' do
    visit garden_path(@garden1)

    # Plans under 100 Days
    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant3.name)

    # Plants over 100 days NOT shown
    expect(page).to_not have_content(@plant2.name)
    expect(page).to_not have_content(@plant4.name)

    # Unique Plants
    expect(page).to have_content(@plant1.name, count: 1)
    expect(page).to have_content(@plant3.name, count: 1)
  end
end
