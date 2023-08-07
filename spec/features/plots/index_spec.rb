require "rails_helper"

RSpec.describe "Plots Index Page" do
  before do
    load_test_data
    visit plots_path
  end

  it "displays a list of all plot numbers" do
    expect(page).to have_content(23)
    expect(page).to have_content(7)
    expect(page).to have_content(12)
    expect(page).to have_content(17)
  end

  it "displays the associated plants under each plot number" do
    within("#plot-23") do
    save_and_open_page
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
      expect(page).to have_content(@plant_7.name)
      expect(page).to_not have_content(@plant_6.name)
    end
    
    within("#plot-12") do
    expect(page).to have_content(@plant_5.name)
    expect(page).to have_content(@plant_6.name)
    expect(page).to have_content(@plant_1.name)
    expect(page).to_not have_content(@plant_2.name)
    end
  end
end

# As a visitor
# When I visit the plots index page ('/plots')
# I see a list of all plot numbers
# And under each plot number I see the names of all that plot's plants