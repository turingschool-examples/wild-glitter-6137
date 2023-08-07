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
      garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
      plot_1 = garden_1.plots.create!(number: 25, size: "Large", direction: "East")
      plot_2 = garden_1.plots.create!(number: 31, size: "Medium", direction: "West")
      plot_3 = garden_1.plots.create!(number: 18, size: "Small", direction: "North")

      visit "/plots"

      expect(page).to have_content(plot_1.number)
      expect(page).to have_content(plot_2.number)
      expect(page).to have_content(plot_3.number)
    end

    it "shows under each plot number the names of all that plot's plants" do
      garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
      plot_1 = garden_1.plots.create!(number: 25, size: "Large", direction: "East")
      plot_2 = garden_1.plots.create!(number: 31, size: "Medium", direction: "West")
      plot_3 = garden_1.plots.create!(number: 18, size: "Small", direction: "North")

      plant_1 = Plant.create!(name: "Flower", description: "Beautiful", days_to_harvest: 14)
      plant_2 = Plant.create!(name: "Watermelon", description: "Big", days_to_harvest: 60)
      plant_3 = Plant.create!(name: "Tomato", description: "Yummy", days_to_harvest: 90)

      plot_1.plants << plant_1
      plot_2.plants << plant_2
      plot_3.plants << plant_3
      plot_3.plants << plant_1

      visit plots_path

      within(".plot:contains('#{plot_1.number}')") do
        expect(page).to have_content(plant_1.name)
      end

      within(".plot:contains('#{plot_2.number}')") do
        expect(page).to have_content(plant_2.name)
      end

      within(".plot:contains('#{plot_3.number}')") do
        expect(page).to have_content(plant_3.name)
        expect(page).to have_content(plant_1.name)
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
# And I still see that plant's name under other 
# plots that is was associated with.
# Note: you do not need to test for any sad paths or 
# implement any flash messages. 

  describe "when I visit the plots index page" do
    it "has a link to remove that plant from that plot next to each plant's name" do
      garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
      plot_1 = garden_1.plots.create!(number: 25, size: "Large", direction: "East")
      plot_2 = garden_1.plots.create!(number: 31, size: "Medium", direction: "West")
      plot_3 = garden_1.plots.create!(number: 18, size: "Small", direction: "North")
  
      plant_1 = Plant.create!(name: "Flower", description: "Beautiful", days_to_harvest: 14)
      plant_2 = Plant.create!(name: "Watermelon", description: "Big", days_to_harvest: 60)
      plant_3 = Plant.create!(name: "Tomato", description: "Yummy", days_to_harvest: 90)
  
      plot_1.plants << plant_1
      plot_2.plants << plant_2
      plot_3.plants << plant_3
      plot_3.plants << plant_1
  
      visit plots_path

      within(".plot:contains('#{plot_1.number}')") do
        expect(page).to have_button("Remove Plant")
      end

      within(".plot:contains('#{plot_2.number}')") do
        expect(page).to have_button("Remove Plant")
      end
      
      within(".plot:contains('#{plot_3.number}')") do
        expect(page).to have_button("Remove Plant")
      end
    end

    it "destroys the plant when the link is clicked and then redirects the user back to the plots index page where I see the plant removed from just that plot" do
      garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
      plot_1 = garden_1.plots.create!(number: 25, size: "Large", direction: "East")
      plot_2 = garden_1.plots.create!(number: 31, size: "Medium", direction: "West")
      plot_3 = garden_1.plots.create!(number: 18, size: "Small", direction: "North")
  
      plant_1 = Plant.create!(name: "Flower", description: "Beautiful", days_to_harvest: 14)
      plant_2 = Plant.create!(name: "Watermelon", description: "Big", days_to_harvest: 60)
      plant_3 = Plant.create!(name: "Tomato", description: "Yummy", days_to_harvest: 90)
  
      plot_1.plants << plant_1
      plot_2.plants << plant_2
      plot_3.plants << plant_1
  
      visit plots_path

      within(".plot:contains('#{plot_3.number}')") do
        click_button "Remove Plant"
        expect(page).not_to have_content(plant_1.name)
      end

      within(".plot:contains('#{plot_1.number}')") do
        expect(page).to have_content(plant_1.name)
      end
    end
  end
end

