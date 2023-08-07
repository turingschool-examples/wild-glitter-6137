require 'rails_helper'

RSpec.describe 'Plots index page' do 
  #   User Story 1, Plots Index Page

  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers

  # And under each plot number I see the names of all that plot's plants
  describe 'when I visit the plots index page' do

    before :each do
      @garden_1 = Garden.create!(name: "Denver Botanic Garden", organic: false)

      @plot_1 = @garden_1.plots.create!(number: 1, size: "Large", direction: "North")
      @plot_2 = @garden_1.plots.create!(number: 2, size: "Small", direction: "East")

      @plant_1 = Plant.create!(name: "Purple Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      @plant_2 = Plant.create!(name: "Red Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      @plant_3 = Plant.create!(name: "Green Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      @plant_4 = Plant.create!(name: "Yellow Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)

      PlantPlot.create!(plot: @plot_1, plant: @plant_1)
      PlantPlot.create!(plot: @plot_1, plant: @plant_2)

      PlantPlot.create!(plot: @plot_2, plant: @plant_3)
      PlantPlot.create!(plot: @plot_2, plant: @plant_4)
      PlantPlot.create!(plot: @plot_2, plant: @plant_1)
    end

    it 'I see a list of all plot numbers' do
      visit "/plots"
      
      expect(page).to have_content('Plots Index')
      expect(page).to have_content('Plot Number')
      expect(page).to have_content(@plot_1.number)
      expect(page).to have_content(@plot_2.number)
      expect(page).to have_content('Plot Plants')
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
      expect(page).to have_content(@plant_3.name)
      expect(page).to have_content(@plant_4.name)
    end

      #     User Story 2, Remove a Plant from a Plot

  # As a visitor
  # When I visit the plots index page
  # Next to each plant's name
  # I see a link to remove that plant from that plot

  # When I click on that link
  # I'm returned to the plots index page
  # And I no longer see that plant listed under that plot,
  # And I still see that plant's name under other plots that is was associated with.

  # Note: you do not need to test for any sad paths or implement any flash messages. 

    it 'I see a link to remove that plant from that plot' do 
      visit "/plots"
      expect(page).to have_content('Purple Flower')
      
      within "#plot-#{@plot_1.id}" do 
        expect(page).to have_button('Remove')
        click_button 'Remove'
      end
      
      expect(current_path).to eq("/plots")
      
      within "#plot-#{@plot_1.id}" do 
        expect(page).to_not have_content('Purple Flower')
        expect(page).to have_content('Red Flower')
      end
      
      within "#plot-#{@plot_2.id}" do 
        expect(page).to have_content('Purple Flower')
      end
    end
  end
end