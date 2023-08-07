@garden_1 = Garden.create!(name: "Portland Communtiy Garden", organic: true)

@plot_1 = @garden_1.plots.create!(number: 1, size: "Small", direction: "East")
@plot_2 = @garden_1.plots.create!(number: 2, size: "Medium", direction: "West")
@plot_3 = @garden_1.plots.create!(number: 3, size: "Large", direction: "North")

@plant_1 = Plant.create!(name: "Sunflower", description: " This is a sunflower", days_to_harvest: 14)
@plant_2 = Plant.create!(name: "Tomato", description: " This is a Tomato", days_to_harvest: 24)
@plant_3 = Plant.create!(name: "Watermelon", description: " This is a Watermelon", days_to_harvest: 34)
@plant_4 = Plant.create!(name: "Cucumber", description: " This is a Cucumber", days_to_harvest: 15)

@plot_1.plants << @plant_1
@plot_2.plants << @plant_2
@plot_3.plants << @plant_3

@plot_1.plants << @plant_4
@plot_2.plants << @plant_4
@plot_3.plants << @plant_4