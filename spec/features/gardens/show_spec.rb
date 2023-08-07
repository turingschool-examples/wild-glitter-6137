require 'rails_helper'

RSpec.describe 'Gardens #show Page', type: :feature do
  describe "When I visit a garden's show page ('/gardens/:id')" do
    before :each do
      @garden_1 = Garden.create!(name: "Denver Community Garden", organic: false)
      @garden_2 = Garden.create!(name: "Boulder Community Garden", organic: true)
  
      @plot_1 = @garden_1.plots.create!(number: 12, size: "Medium", direction: "South")
      @plot_2 = @garden_1.plots.create!(number: 23, size: "small", direction: "North")
      @plot_3 = @garden_1.plots.create!(number: 37, size: "large", direction: "West")
  
      @plot_4 = @garden_2.plots.create!(number: 58, size: "Medium", direction: "East")
      @plot_5 = @garden_2.plots.create!(number: 16, size: "small", direction: "South")
  
      @plant_1 = Plant.create!(name: "Arugula", description: "Harvest in Winter/Spring", days_to_harvest: 140)
      @plant_2 = Plant.create!(name: "Beets", description: "Harvest all Winter", days_to_harvest: 90)
      @plant_3 = Plant.create!(name: "Carrots", description: "Harvest in Winter/Spring", days_to_harvest: 180)
      @plant_4 = Plant.create!(name: "Garlic", description: "Harvest all Summer", days_to_harvest: 80)
      @plant_5 = Plant.create!(name: "Swiss Chard", description: "Harvest in Fall/Winter", days_to_harvest: 120)
      @plant_6 = Plant.create!(name: "Turnips", description: "Harvest in Winter/Spring", days_to_harvest: 130)
  
      @pp_1 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_1.id)
      @pp_2 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_2.id)
      @pp_3 = PlotPlant.create!(plot_id: @plot_2.id, plant_id: @plant_3.id)
      @pp_4 = PlotPlant.create!(plot_id: @plot_2.id, plant_id: @plant_4.id)
      @pp_5 = PlotPlant.create!(plot_id: @plot_3.id, plant_id: @plant_2.id)
      @pp_9 = PlotPlant.create!(plot_id: @plot_3.id, plant_id: @plant_4.id)
  
      @pp_6 = PlotPlant.create!(plot_id: @plot_4.id, plant_id: @plant_5.id)
      @pp_7 = PlotPlant.create!(plot_id: @plot_4.id, plant_id: @plant_6.id)
      @pp_8 = PlotPlant.create!(plot_id: @plot_5.id, plant_id: @plant_2.id)
  
      visit garden_path(@garden_1)
    end

    it "only shows unique plant that take less than 100 days to harvest" do
      within(".garden-quick-harvest-plants") do
        expect(page).to have_content(@plant_2.name, count: 1)
        expect(page).to have_content(@plant_2.description, count: 1)
        expect(page).to have_content(@plant_2.days_to_harvest, count: 1)

        expect(page).to have_content(@plant_4.name, count: 1)
        expect(page).to have_content(@plant_4.description, count: 1)
        expect(page).to have_content(@plant_4.days_to_harvest, count: 1)
      end
    end
  end
end