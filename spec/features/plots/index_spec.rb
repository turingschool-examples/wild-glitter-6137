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

  describe "delete plant function" do
    it "has a button next to plant name to remove it from plot" do
      within("#plot-23") do
        expect(page).to have_button("Remove")
      end
      within("#plot-7") do
        expect(page).to have_button("Remove")
      end
      within("#plot-12") do
        expect(page).to have_button("Remove")
      end
      within("#plot-17") do
        expect(page).to have_button("Remove")
      end
    end

    it "redirects back to index page once button is clicked" do
      within("#plot-23") do
        click_button("Remove tomato")
      end

      expect(current_path).to eq(plots_path)
    end

    it "removes the plant only from the plot in which it was deleted" do
      within("#plot-7") do
        click_button("Remove marigold")
      end

      within("#plot-7") do
        expect(page).to_not have_content("marigold")
      end

      within("#plot-17") do
        expect(page).to have_content("marigold")
      end
    end
  end
end

# User Story 2, Remove a Plant from a Plot

# As a visitor
# When I visit the plots index page
# Next to each plant's name
# I see a link to remove that plant from that plot
# When I click on that link
# I'm returned to the plots index page
# And I no longer see that plant listed under that plot,
# And I still see that plant's name under other plots that is was associated with.

# Note: you do not need to test for any sad paths or implement any flash messages. 