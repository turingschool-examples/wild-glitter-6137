require "rails_helper"

RSpec.describe "Plots Index Page" do
  before do
    load_test_data
    visit garden_path(@garden_1)
  end

  it "displays the plants in this garden's plots without duplicates" do
    expect(page).to have_content("cilantro").once
  end


  it "displays only plants which take less than 100 days to harvest" do
    expect(page).to have_content("carrot")
    expect(page).to have_content("cilantro")
    expect(page).to have_content("marigold")
    expect(page).to have_content("radish")
    
    expect(page).to_not have_content("tomato")
    expect(page).to_not have_content("pepper")
  end


end

#   User Story 3, Garden's Plants

# As a visitor
# When I visit a garden's show page ('/gardens/:id')
# Then I see a list of plants that are included in that garden's plots
# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take less than 100 days to harvest