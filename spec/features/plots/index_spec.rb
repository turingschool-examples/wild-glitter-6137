require "rails_helper"

RSpec.describe "the plots index page" do
  before(:each) do
    test_data
  end
  # user story 1
  it "displays a list of all plot numbers, with each plot's plants underneath" do
    visit plots_path

    expect(page).to have_content(30)
    expect(page).to have_content(50)
    expect(page).to have_content("Green Cabbage")
    expect(page).to have_content("Cherry Tomato")
    expect("Green Cabbage").to appear_before("Bell Pepper")
  end
  # user story 2
  # As a visitor
  # When I visit the plots index page
  # Next to each plant's name
  # I see a link to remove that plant from that plot
  # When I click on that link
  # I'm returned to the plots index page
  # And I no longer see that plant listed under that plot,
  # And I still see that plant's name under other plots that is was associated with.
  # Note: you do not need to test for any sad paths or implement any flash messages. 
  it "displays a link/button to remove plant from plot next to each plant" do
    visit plots_path

    expect(page).to have_link "Remove Plant"
  end

  it "returns me to the plots index upon clicking the link and I no longer see that plant listed under the plot" do
    visit plots_path

    expect(page).to have_link "Remove Plant"

    first(:link, "Remove Plant").click

    expect(page).to_not have_content("Cherry Tomato")
  end
end