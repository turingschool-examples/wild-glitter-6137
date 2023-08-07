require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plant_plots).through(:plots)}
    it { should have_many(:plants).through(:plant_plots)}
  end

  describe 'instance methods' do
    it "#plant_occurances" do
    garden1 = Garden.create!(name: "example garden", organic: true)
    
    plot1 = garden1.plots.create!(number: 1, size: "large", direction: "east")
    plot2 = garden1.plots.create!(number: 2, size: "medium", direction: "west")
    plot3 = garden1.plots.create!(number: 3, size: "small", direction: "north")

    plant1 = plot1.plants.create!(name: "Tomato", description:
    "Fruit not vegetable", days_to_harvest: 75 )
    plant2 = plot1.plants.create!(name: "Kale", description:
    "Leafy", days_to_harvest: 50 )
    plant3 = plot2.plants.create!(name: "Brocolli", description:
    "Leafy head", days_to_harvest: 60 )
    plant4 = plot2.plants.create!(name: "Tomatillo", description:
    "Fruit", days_to_harvest: 80 )
    plant5 = plot3.plants.create!(name: "Grape", description:
    "Fruit vine", days_to_harvest: 100 )
    plant6 = plot3.plants.create!(name: "Tomato", description:
    "Fruit not vegetable", days_to_harvest: 75 )
    plant7 = plot2.plants.create!(name: "Tomato", description:
    "Fruit not vegetable", days_to_harvest: 75 )
    plant8 = plot2.plants.create!(name: "Grape", description:
    "Fruit vine", days_to_harvest: 100 )
#require 'pry'; binding.pry
      expect(garden1.plant_occurances.first.name).to eq("Tomato")
      expect(garden1.plant_occurances.second.name).to eq("Grape")
    end
  end
end