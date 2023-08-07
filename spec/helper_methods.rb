def load_test_data
  @garden_1 = Garden.create!(name: "Veggies", organic: true)
  @garden_2 = Garden.create!(name: "Community", organic: false)

  @plot_1 = @garden_1.plots.create!(number: 23, size: "Medium", direction: "South")
  @plot_2 = @garden_1.plots.create!(number: 7, size: "Small", direction: "West")
  @plot_3 = @garden_2.plots.create!(number: 12, size: "Large", direction: "North")
  @plot_4 = @garden_2.plots.create!(number: 17, size: "Small", direction: "West")

  @plant_1 = Plant.create!(name: "tomato", description: "Needs lots of sun and water.", days_to_harvest: 120)
  @plant_2 = Plant.create!(name: "pepper", description: "Prefers to dry out between waters.", days_to_harvest: 105)
  @plant_3 = Plant.create!(name: "marigold", description: "Great companion to fight pests.", days_to_harvest: 45)
  @plant_4 = Plant.create!(name: "radish", description: "Prefers cool, moist soil.", days_to_harvest: 30)
  @plant_5 = Plant.create!(name: "daisy", description: "Attracts pollinators.", days_to_harvest: 365)
  @plant_6 = Plant.create!(name: "native milkweed", description: "Attracts butterflies.", days_to_harvest: 150)
  @plant_7 = Plant.create!(name: "carrot", description: "Needs loose, nutrient rich soil.", days_to_harvest: 90)
  @plant_8 = Plant.create!(name: "cilantro", description: "Prefers cool weather.", days_to_harvest: 60)
end