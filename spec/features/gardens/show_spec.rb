require "rails_helper"

RSpec.describe "the garden's show page" do
  before(:each) do
    test_data
  end
  # user story 3
  # As a visitor
  # When I visit a garden's show page ('/gardens/:id')
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest
  it "displays a list of plants that are included in that garden's plots" do
    visit garden_path(@garden_2)

    expect(page).to have_content()
  end
end