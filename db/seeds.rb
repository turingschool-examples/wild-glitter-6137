# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


garden = Garden.create!(name: "Wild Flowers", organic: true)
plot1 = garden.plots.create!(number: 1, size: "Medium", direction: "East")
plot2 = garden.plots.create!(number: 2, size: "Small", direction: "West")

plant1 = Plant.create!(name: "New England Aster", description: "Perennial salt-tolerant plant", days_to_harvest: 10)
plant2 = Plant.create!(name: "Blanket Flowers", description: "Plains Wildflower", days_to_harvest: 7)
plant3 = Plant.create!(name: "Queen Anne's Lace", description: "Related to carrots and smells like carrots", days_to_harvest: 14)


PlotPlant.create!(plot_id: plot1.id, plant_id: plant1.id)
PlotPlant.create!(plot_id: plot1.id, plant_id: plant2.id)
PlotPlant.create!(plot_id: plot1.id, plant_id: plant3.id)

PlotPlant.create!(plot_id: plot2.id, plant_id: plant1.id)
PlotPlant.create!(plot_id: plot2.id, plant_id: plant2.id)