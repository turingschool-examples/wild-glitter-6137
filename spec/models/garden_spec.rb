require "rails_helper"

RSpec.describe Garden, type: :model do
  before :each do
    test_data
  end
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should allow_value(%w(true false)).for(:organic) }
  end

  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe "instance methods" do
    it "#plants_less_than_100" do
      crowded_garden = Garden.create!(name: "Dubai Mircale Garden", organic: true)

      plot_1 = crowded_garden.plots.create!(number: 13, size: "Large", direction: "North")
      plot_2 = crowded_garden.plots.create!(number: 14, size: "Small", direction: "South")

      plant_1 = Plant.create!(name: "Hydnora", description: "It's a parasite that latches on to the roots of other species and grows entirely underground except for the flower.", days_to_harvest: 85)
      plant_2 = Plant.create!(name: "Purple Pitcher Plant", description: "Insects are trapped inside the plant after they slide down the plants slimy innards by small hairs tilted downward inside the plant.", days_to_harvest: 90)
      plant_3 = Plant.create!(name: "Parachute flower", description: "The flower's smell beckons insects inside. Once there, the insects are trapped but not eaten by the plant.", days_to_harvest: 90)
      plant_4 = Plant.create!(name: "Hammer orchid", description: "The plant produces pheromones — chemicals that alter the behavior of a creature of the same species — that draw male wasps who may mistake the orchid for a female wasp.", days_to_harvest: 105)
      plant_5 = Plant.create!(name: "Suicide palm", description: "At the end of its life, the stem tips explode in a massive show of tiny flowers capable of being pollinated and developing into fruit as it dies.", days_to_harvest: 3650)
      plant_6 = Plant.create!(name: "Strangler fig", description: "A 'parasitic nightmare', when the fig grows downward, it robs its host, usually a living tree, of its nutrients. When the fig grows upward, its leaves block sunlight from reaching the host.", days_to_harvest: 7300)
    
      plot_1.plants.push(plant_1, plant_1, plant_1, plant_2)
      plot_2.plants.push(plant_3, plant_3, plant_3, plant_2)

      expect(crowded_garden.plants_less_than_100).to match_array([plant_1.name, plant_2.name, plant_3.name])
    end
  end
end