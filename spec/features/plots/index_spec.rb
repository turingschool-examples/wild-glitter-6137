require "rails_helper"

describe "plots index" do
  before :each do
    @garden_1 = Garden.create!(name: "Garden Variety", organic: true)
    @garden_2 = Garden.create!(name: "Monocrop City", organic: false)
    
    @plot_1 = @garden_1.plots.create!(number: 10, size: "Small", direction: "North")
    @plot_2 = @garden_1.plots.create!(number: 20, size: "Medium", direction: "East")
    @plot_3 = @garden_2.plots.create!(number: 25, size: "Medium", direction: "South")
    @plot_4 = @garden_2.plots.create!(number: 50, size: "Large", direction: "West")

    @plant_1 = Plant.create!(name: "Wild Iris", description: "Delicate and beautiful", days_to_harvest: 50)
    @plant_2 = Plant.create!(name: "Rose", description: "Thorny", days_to_harvest: 60)
    @plant_3 = Plant.create!(name: "Sunflower", description: "Brightens up any place!", days_to_harvest: 40)
    @plant_4 = Plant.create!(name: "Aloe", description: "Soothing", days_to_harvest: 30)
    @plant_5 = Plant.create!(name: "Monstera", description: "Low light plant", days_to_harvest: 20)
    @plant_6 = Plant.create!(name: "Hanging Vine", description: "Spindly vines", days_to_harvest: 10)

    @plant_plot_1 = PlantPlot.create!(plant_id: @plant_1.id, plot_id: @plot_1.id)
    @plant_plot_2 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_1.id)
    @plant_plot_3 = PlantPlot.create!(plant_id: @plant_2.id, plot_id: @plot_2.id)
    @plant_plot_4 = PlantPlot.create!(plant_id: @plant_3.id, plot_id: @plot_2.id)
    @plant_plot_5 = PlantPlot.create!(plant_id: @plant_3.id, plot_id: @plot_3.id)
    @plant_plot_6 = PlantPlot.create!(plant_id: @plant_4.id, plot_id: @plot_3.id)
    @plant_plot_7 = PlantPlot.create!(plant_id: @plant_4.id, plot_id: @plot_4.id)
    @plant_plot_8 = PlantPlot.create!(plant_id: @plant_1.id, plot_id: @plot_4.id)

    visit plots_path
  end

  it "can see all plots and plants associated with each plot" do
    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plot_3.number)
    expect(page).to have_content(@plot_4.number)
    within "#plot_#{@plot_1.id}" do
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
      expect(page).to_not have_content(@plant_3.name)
    end
  end

  it "has a link to delete from plot next to each plant" do
    within "#plot_#{@plot_1.id}" do
      within "##{@plant_plot_1.id}" do
        expect(page).to have_button("Delete Plant From Plot")
        click_button "Delete Plant From Plot"
      end
    end

    expect(current_path).to eq(plots_path)

    within "#plot_#{@plot_1.id}" do
      expect(page).to_not have_content(@plant_1.name)
    end

    within "#plot_#{@plot_4.id}" do
      expect(page).to have_content(@plant_1.name)
    end
  end
end
