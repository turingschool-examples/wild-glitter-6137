require "rails_helper"

RSpec.describe "The Gardens", type: :feature do
  before :each do
    test_data
  end

  describe "#show page" do
    it "displays a DISTINCT list of plots plants that take LESS THAN 100 days to harvest" do
      visit garden_path(@garden_1)
      # @garden_1.plots.first.plants.where("days_to_harvest < ?", 100).distinct.pluck(:name)
      expect(page).to have_content("Hydnora")
      expect(page).to have_content("Purple Pitcher Plant")
    end
  end
end