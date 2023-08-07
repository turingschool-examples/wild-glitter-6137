require 'rails_helper'

RSpec.describe 'Plots #index Page', type: :feature do
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
    @pp_5 = PlotPlant.create!(plot_id: @plot_3.id, plant_id: @plant_5.id)

    @pp_6 = PlotPlant.create!(plot_id: @plot_4.id, plant_id: @plant_5.id)
    @pp_7 = PlotPlant.create!(plot_id: @plot_4.id, plant_id: @plant_6.id)
    @pp_8 = PlotPlant.create!(plot_id: @plot_5.id, plant_id: @plant_2.id)

    visit plots_path
  end

  describe "When I visit the plots index page ('/plots')" do
    it "shows a list of all the plot numbers" do
      within("#plot-#{@plot_1.id}") do
        expect(page).to have_content(@plot_1.number, count: 1)
      end

      within("#plot-#{@plot_2.id}") do
        expect(page).to have_content(@plot_2.number, count: 1)
      end

      expect(page).to have_content(@plot_3.number, count: 1)
      expect(page).to have_content(@plot_4.number, count: 1)
      expect(page).to have_content(@plot_5.number, count: 1)
    end

    it "shows the names of all the plants for each plot" do
      within("#plot-#{@plot_1.id}") do
        expect(page).to have_content(@plant_1.name)
        expect(page).to have_content(@plant_2.name)
      end

      within("#plot-#{@plot_2.id}") do
        expect(page).to have_content(@plant_3.name)
        expect(page).to have_content(@plant_4.name)
      end

      within("#plot-#{@plot_3.id}") do
        expect(page).to have_content(@plant_5.name)
      end
    end

    it "has a button next to each plant's name to remove from the plot" do
      within("#plot-#{@plot_1.id}") do
        expect(page).to have_link("[Delete]", href: plot_plant_path(@pp_1.id))
        expect(page).to have_link("[Delete]", href: plot_plant_path(@pp_2.id))
      end

      within("#plot-#{@plot_2.id}") do
        expect(page).to have_link("[Delete]", href: plot_plant_path(@pp_3.id))
        expect(page).to have_link("[Delete]", href: plot_plant_path(@pp_4.id))
      end

      within("#plot-#{@plot_3.id}") do
        expect(page).to have_link("[Delete]", href: plot_plant_path(@pp_5.id))
      end
    end

    it "when click, removes the plant from the plot and redirects to the plots #index page" do 
      within("#plot-#{@plot_1.id}") do
        expect(page).to have_content(@plant_1.name)

        click_link("[Delete]", id: "delete-#{@pp_1.id}")
      end

      expect(current_path).to eq(plots_path)

      within("#plot-#{@plot_1.id}") do
        expect(page).to_not have_content(@plant_1.name)
      end
    end
  end
end