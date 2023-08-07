require "rails_helper"

RSpec.describe "plots index page", type: :feature do

  # User Story 1, Plots Index Page
  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see the names of all 
  # that plot's plants
  describe "when I visit the plots index page" do
    it "shows a list of all plot number" do
      garden_1 = Garden.create!(name: "Turing Community Garden", organice: true)
      plot_1 = garden_1.plots.create!(number: 25, size "Large", direction: "East")
      plot_2 = garden_1.plots.create!(number: 31, size "Medium", direction: "West")
      plot_3 = garden_1.plots.create!(number: 18, size "Small", direction: "North")

      visit "/plots"
      
      expect(page).to have_content(plot_1.number)
      expect(page).to have_content(plot_2.number)
      expect(page).to have_content(plot_3.number)
    end
  end
end

