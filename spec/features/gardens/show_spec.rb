require "rails_helper"

RSpec.describe "the garden's show page" do
  before(:each) do
    test_data
  end
  # user story 3
  it "displays a list of plants that are included in that garden's plots with no duplicates and are less than 100 days to harvest" do
    visit garden_path(@garden_2)

    expect(page).to have_content("Powell Family Garden")
    expect(page).to have_content("String Bean")
    expect(page).to have_content("Bell Pepper")
    expect(page).to have_content("Cherry Tomato")

    expect("Cherry Tomato").to appear_before("Bell Pepper")
  end
end