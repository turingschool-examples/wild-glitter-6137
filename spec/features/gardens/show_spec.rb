require "rails_helper"

describe "Garden Show page Page" do
  before :each do
    @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
    
    @plot_1 = @garden_1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @garden_1.plots.create!(number: 20, size: "Medium", direction: "West")

    @bell = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @pepper = Plant.create!(name: "Banana pepper", description: "Prefers heat and a long growing season.", days_to_harvest: 70)
    
    @sweet = Plant.create!(name: "Sweet Potato", description: "Prefers warm weather and warm soil.", days_to_harvest: 95)
    @onion = Plant.create!(name: "Onion", description: "layers????", days_to_harvest: 110)

    PlantPlot.create!(plant: @bell, plot: @plot_1)
    PlantPlot.create!(plant: @pepper, plot: @plot_1)
    PlantPlot.create!(plant: @sweet, plot: @plot_1)

    PlantPlot.create!(plant: @sweet, plot: @plot_2)
    PlantPlot.create!(plant: @onion, plot: @plot_2)
    
  end

  describe "As a visitor when visting the garden show page" do 
    it "has a list of plants included in the gardens plots, the list is unique, and only has plants that have less than 100 days" do 
      visit garden_path(@garden_1)

      expect(page).to have_content("Purple Beauty Sweet Bell Pepper")
      expect(page).to have_content("Banana pepper")
      expect(page).to have_content("Sweet Potato")

      expect(page).to_not have_content("Sweet Potato", count: 2)
      expect(page).to_not have_content("Onion")
    end

    it "has a list of plants included in the gardens plots, the list is unique" do 
      PlantPlot.create!(plant: @bell, plot: @plot_2)
      
      visit garden_path(@garden_1)

      expect(page).to have_content("Purple Beauty Sweet Bell Pepper")
      expect(page).to have_content("Banana pepper")
      expect(page).to have_content("Sweet Potato")

      expect(page).to_not have_content("Sweet Potato", count: 2)
      expect(page).to_not have_content("Purple Beauty Sweet Bell Pepper", count: 2)
      expect(page).to_not have_content("Onion")
    end

    it "has a list of plants included in the gardens plots, the list only has plants that have less than 100 days" do 
      carrot = Plant.create!(name: "CARROTS", description: "Good for the eyes ig", days_to_harvest: 100)
      eggplant = Plant.create!(name: "eggplant!!", description: "PURPLE???", days_to_harvest: 110)
      
      PlantPlot.create!(plant: carrot, plot: @plot_1)
      PlantPlot.create!(plant: eggplant, plot: @plot_1)
      visit garden_path(@garden_1)

      expect(page).to have_content("Purple Beauty Sweet Bell Pepper", count: 1)
      expect(page).to have_content("Banana pepper", count: 1)
      expect(page).to have_content("Sweet Potato", count: 1)

      expect(page).to_not have_content("Sweet Potato", count: 2)
      expect(page).to_not have_content("Onion")
      expect(page).to_not have_content("CARROTS")
      expect(page).to_not have_content("eggplant!!")
    end
    
    # User story 4
    xit "has a list of plants sorted by the number of times it appears in the garden from most to least" do 
      visit garden_path(@garden_1)

      expect(page).to have_content("Sweet Potato")
      expect(page).to have_content("Purple Beauty Sweet Bell Pepper")
      expect(page).to have_content("Banana pepper")

      expect("Sweet Potato").to appear_before("Purple Beauty Sweet Bell Pepper")
      
      expect(page).to_not have_content("Sweet Potato", count: 2)
      expect(page).to_not have_content("Onion")
    end
  end
end