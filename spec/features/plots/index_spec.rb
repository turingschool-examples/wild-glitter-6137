require "rails_helper"

RSpec.describe "the plots index page" do
  before(:each) do
    test_data
  end
  # user story 1
  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see the names of all that plot's plants
  it "displays a list of all plot numbers, with each plot's plants underneath" do
    visit "/plots/index"

    expect(page).to have_content(30)
    expect(page).to have_content(50)
    expect(page).to have_content("Green Cabbage")
    expect(page).to have_content("Cherry Tomato")
    expect("Green Cabbage").to appear_before("Bell Pepper")
  end
end