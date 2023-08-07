# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


@garden = Garden.create(name: 'Test Garden')

@plot1 = @garden.plots.create(number: 1)
@plot2 = @garden.plots.create(number: 2)
@plot3 = @garden.plots.create(number: 3)

@plant1 = Plant.create(name: 'Plant 1', description: 'Description 1', days_to_harvest: 90)
@plant2 = Plant.create(name: 'Plant 2', description: 'Description 2', days_to_harvest: 80)
@plant3 = Plant.create(name: 'Plant 3', description: 'Description 3', days_to_harvest: 120)

@plot1.plants << @plant1
@plot2.plants << @plant1
@plot2.plants << @plant2
@plot3.plants << @plant1
@plot3.plants << @plant3


