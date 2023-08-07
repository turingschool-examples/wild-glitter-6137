require "rails_helper"

RSpec.describe "Plots index page" do
  before do
    @garden = Garden.create!(name: "Community Garden", organic: true)

    @plot_1 = @garden.plots.create!(number: 1, size: "Small", direction: "South")
    @plot_2 = @garden.plots.create!(number: 2, size: "Medium", direction: "East")
    @plot_3 = @garden.plots.create!(number: 3, size: "Large", direction: "West")
    @plot_4 = @garden.plots.create!(number: 4, size: "Small", direction: "North")
    @plot_5 = @garden.plots.create!(number: 5, size: "Medium", direction: "South-East")

    @pepper = Plant.create!(name: "Black Pearl Pepper", description: "Partial to full sun, good drainage", days_to_harvest: 120)
    @chard = Plant.create!(name: "Bright Lights Swiss Chard", description: "Full sun, good drainage", days_to_harvest: 60)
    @broccoli = Plant.create!(name: "Romanesco Broccoli", description: "Partial shade, alkaline soil", days_to_harvest: 100)
    @squash = Plant.create!(name: "Turban Squash", description: "Full sun, good drainage", days_to_harvest: 100)
    @carrot = Plant.create!(name: "Purple Haze Carrot", description: "Full sun, average water needs", days_to_harvest: 70)
    @bean = Plant.create!(name: "Purple Hyacinth Bean", description: "Full sun, loamy soil, keep moist", days_to_harvest: 90)

    PlotPlant.create!(plot: @plot_1, plant: @pepper)
    PlotPlant.create!(plot: @plot_1, plant: @chard)
    PlotPlant.create!(plot: @plot_1, plant: @squash)
    PlotPlant.create!(plot: @plot_1, plant: @carrot)
    PlotPlant.create!(plot: @plot_1, plant: @bean)

    PlotPlant.create!(plot: @plot_2, plant: @chard)
    PlotPlant.create!(plot: @plot_2, plant: @carrot)
    PlotPlant.create!(plot: @plot_2, plant: @bean)

    PlotPlant.create!(plot: @plot_3, plant: @pepper)
    PlotPlant.create!(plot: @plot_3, plant: @squash)

    PlotPlant.create!(plot: @plot_4, plant: @broccoli)
    PlotPlant.create!(plot: @plot_4, plant: @pepper)

    PlotPlant.create!(plot: @plot_5, plant: @pepper)
    PlotPlant.create!(plot: @plot_5, plant: @carrot)
    PlotPlant.create!(plot: @plot_5, plant: @bean)
  end

  #User story 1
  it "has a list of all plot numbers" do
    visit plots_path

    expect(page).to have_content("Plot Number: 1")
    expect(page).to have_content("Plot Number: 2")
    expect(page).to have_content("Plot Number: 3")
    expect(page).to have_content("Plot Number: 4")
    expect(page).to have_content("Plot Number: 5")
  end

  it "has all plants belonging to each plot number" do
    visit plots_path

    within("#plot-#{@plot_1.id}") do
      expect(page).to have_content("Black Pearl Pepper")
      expect(page).to have_content("Bright Lights Swiss Chard")
      expect(page).to have_content("Turban Squash")
      expect(page).to have_content("Purple Haze Carrot")
      expect(page).to have_content("Purple Hyacinth Bean")
      expect(page).to_not have_content("Romanesco Broccoli")
    end

    within("#plot-#{@plot_2.id}") do
      expect(page).to have_content("Bright Lights Swiss Chard")
      expect(page).to have_content("Purple Hyacinth Bean")
      expect(page).to have_content("Purple Haze Carrot")
      expect(page).to_not have_content("Turban Squash")
      expect(page).to_not have_content("Black Pearl Pepper")
      expect(page).to_not have_content("Romanesco Broccoli")
    end

    within("#plot-#{@plot_3.id}") do
      expect(page).to have_content("Black Pearl Pepper")
      expect(page).to have_content("Turban Squash")
      expect(page).to_not have_content("Bright Lights Swiss Chard")
      expect(page).to_not have_content("Purple Haze Carrot")
      expect(page).to_not have_content("Purple Hyacinth Bean")
      expect(page).to_not have_content("Romanesco Broccoli")
    end

    within("#plot-#{@plot_4.id}") do
      expect(page).to have_content("Black Pearl Pepper")
      expect(page).to have_content("Romanesco Broccoli")
      expect(page).to_not have_content("Bright Lights Swiss Chard")
      expect(page).to_not have_content("Turban Squash")
      expect(page).to_not have_content("Purple Haze Carrot")
      expect(page).to_not have_content("Purple Hyacinth Bean")
    end

    within("#plot-#{@plot_5.id}") do
      expect(page).to have_content("Black Pearl Pepper")
      expect(page).to have_content("Purple Haze Carrot")
      expect(page).to have_content("Purple Hyacinth Bean")
      expect(page).to_not have_content("Bright Lights Swiss Chard")
      expect(page).to_not have_content("Turban Squash")
      expect(page).to_not have_content("Romanesco Broccoli")
    end
  end

  # User Story 2
  it "has a button next to each plant to remove it" do
    visit plots_path

    within("#plot-#{@plot_1.id}") do
      within("#plot-#{@plot_1.id}-plant-#{@pepper.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
      within("#plot-#{@plot_1.id}-plant-#{@chard.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
      within("#plot-#{@plot_1.id}-plant-#{@squash.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
      within("#plot-#{@plot_1.id}-plant-#{@carrot.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
      within("#plot-#{@plot_1.id}-plant-#{@bean.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
    end

    within("#plot-#{@plot_2.id}") do
      within("#plot-#{@plot_2.id}-plant-#{@chard.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
      within("#plot-#{@plot_2.id}-plant-#{@bean.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
      within("#plot-#{@plot_2.id}-plant-#{@carrot.id}") do
        expect(page).to have_button("Remove Plant From Plot")
      end
    end
  end

  it "can remove plants from a plot" do
    visit plots_path

    within("#plot-#{@plot_1.id}") do
      expect(page).to have_content("Black Pearl Pepper")
      within("#plot-#{@plot_1.id}-plant-#{@pepper.id}") do
        click_button("Remove Plant From Plot")
      end
      expect(page).to have_content("Bright Lights Swiss Chard")
      within("#plot-#{@plot_1.id}-plant-#{@chard.id}") do
        click_button("Remove Plant From Plot")
      end
    end

    expect(current_path).to eq(plots_path)

    within("#plot-#{@plot_1.id}") do
      expect(page).to_not have_content("Black Pearl Pepper")
      expect(page).to_not have_content("Bright Lights Swiss Chard")
    end

    within("#plot-#{@plot_2.id}") do
      expect(page).to have_content("Bright Lights Swiss Chard")
    end

    within("#plot-#{@plot_3.id}") do
      expect(page).to have_content("Black Pearl Pepper")
    end

    within("#plot-#{@plot_4.id}") do
      expect(page).to have_content("Black Pearl Pepper")
    end

    within("#plot-#{@plot_5.id}") do
      expect(page).to have_content("Black Pearl Pepper")
    end
  end
end