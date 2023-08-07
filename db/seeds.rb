  @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
  @garden_2 = Garden.create!(name: "Powell Family Garden", organic: true)

  @plot_1 = @garden_1.plots.create!(number: 30, size: "Large", direction: "West")
  @plot_2 = @garden_2.plots.create!(number: 50, size: "Extra Large", direction: "North")

  @plant_1 = Plant.create!(name: "Bell Pepper", description: "This one's orange", days_to_harvest: 90)
  @plant_2 = Plant.create!(name: "Radish", description: "It's a radish", days_to_harvest: 120)
  @plant_3 = Plant.create!(name: "Cherry Tomato", description: "You'll have way too many of them to know what to do with", days_to_harvest: 65)
  @plant_4 = Plant.create!(name: "Green Cabbage", description: "MY CABBAGES", days_to_harvest: 150)

  PlantPlot.create!(plot_id: @plot_1.id, plant_id: @plant_4.id)
  PlantPlot.create!(plot_id: @plot_1.id, plant_id: @plant_3.id)
  PlantPlot.create!(plot_id: @plot_2.id, plant_id: @plant_2.id)
  PlantPlot.create!(plot_id: @plot_2.id, plant_id: @plant_1.id)