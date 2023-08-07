def load_test_data
  @garden1 = Garden.create!(name: 'Turing Community Garden', organic: true)
  @garden2 = Garden.create!(name: 'Main Street Garden', organic: false)

  @plot1 = Plot.create!(number: 25, size: 'Large', direction: 'East', garden: @garden1)
  @plot2 = Plot.create!(number: 10, size: 'Small', direction: 'North', garden: @garden1)
  @plot3 = Plot.create!(number: 30, size: 'Medium', direction: 'East', garden: @garden2)

  @plant1 = Plant.create!(name: 'Tomato', description: 'Easy to care for, generates sauce', days_to_harvest: 90)
  @plant2 = Plant.create!(name: 'Eggplant', description: 'Difficult to care for, but delicious', days_to_harvest: 120)
  @plant3 = Plant.create!(name: 'Melon', description: 'Grows quickly, tastes good', days_to_harvest: 50)

  PlantPlot.create!(plant: @plant1, plot: @plot1)
  PlantPlot.create!(plant: @plant2, plot: @plot1)
  PlantPlot.create!(plant: @plant3, plot: @plot2)
end
