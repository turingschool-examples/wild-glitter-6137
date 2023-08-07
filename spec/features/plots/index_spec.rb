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