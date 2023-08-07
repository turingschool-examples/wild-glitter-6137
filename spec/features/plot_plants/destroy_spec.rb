require "rails_helper"

RSpec.describe "plot_plants destroy" do
  before(:each) do
    @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden_2 = Garden.create!(name: "Dads Catus Garden", organic: false)
    @plot_1 = @garden_1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @garden_2.plots.create!(number: 13, size: "Small", direction: "South")
    @plant_1 = @plot_1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = @plot_2.plants.create!(name: "Barrel Cactus", description: "Prefers dry dirt.", days_to_harvest: 600)
    @plant_3 = Plant.create!(name: "Palm Tree", description: "Rain Forrest.", days_to_harvest: 50)
  end
# As a visitor
# When I visit the plots index page
# Next to each plant's name
# I see a link to remove that plant from that plot
# When I click on that link
# I'm returned to the plots index page
# And I no longer see that plant listed under that plot,
# And I still see that plant's name under other plots that is was associated with.
    describe "When I visit the plots index page" do
      it "I see a link to remove that plant from that plot" do
        visit plots_path
        
        expect(page).to have_content(@plot_1.number)
        expect(page).to have_content(@plant_1.name)
        expect(page).to have_content(@plot_2.number)
        expect(page).to have_content(@plant_2.name)

      
        
        # click_link "Remove"
    
        
        
        # save_and_open_page

        #  expect(page).to have_content(@plot_1.number)
        #  expect(page).not_to have_content(@plant_1.name)
        #  expect(page).to have_content(@plot_2.number)
        #  expect(page).to have_content(@plant_2.name)

        
      end

  end
end 