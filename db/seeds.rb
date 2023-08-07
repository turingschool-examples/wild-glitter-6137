# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PlantPlot.destroy_all
Plot.destroy_all
Garden.destroy_all
Plant.destroy_all

garden1 = Garden.create!(name: 'Turing Community Garden', organic: true)
garden2 = Garden.create!(name: 'Main Street Garden', organic: false)
garden3 = Garden.create!(name: 'Backyard Garden', organic: true)

plot1 = Plot.create!(number: 25, size: 'Large', direction: 'East', garden: garden1)
plot2 = Plot.create!(number: 10, size: 'Small', direction: 'North', garden: garden1)
plot3 = Plot.create!(number: 30, size: 'Medium', direction: 'East', garden: garden2)
plot4 = Plot.create!(number: 40, size: 'Large', direction: 'West', garden: garden3)

plant1 = Plant.create!(name: 'Tomato', description: 'Easy to care for, generates sauce', days_to_harvest: 90)
plant2 = Plant.create!(name: 'Eggplant', description: 'Difficult to care for, but delicious', days_to_harvest: 120)
plant3 = Plant.create!(name: 'Melon', description: 'Grows quickly, tastes good', days_to_harvest: 50)
plant4 = Plant.create!(name: 'Corn', description: 'So many corns', days_to_harvest: 100)

plot1.plants << plant1
plot1.plants << plant2
plot1.plants << plant4
plot2.plants << plant1
plot2.plants << plant3
plot2.plants << plant4
plot3.plants << plant1
plot3.plants << plant4
plot4.plants << plant4
