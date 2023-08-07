require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end
  describe 'instance methods' do
    it 'unique_plants_under_100_days' do
      @garden = Garden.create!(name: 'Backstreet Garden', organic: true)
      @plot1 = Plot.create!(number: 1, size: 'Large', direction: 'North', garden: @garden)
      @plot2 = Plot.create!(number: 2, size: 'Small', direction: 'East', garden: @garden)
      @plant1 = Plant.create!(name: 'Tomato', description: 'Tasty', days_to_harvest: 100)
      @plant2 = Plant.create!(name: 'Lettuce', description: 'Crunchy', days_to_harvest: 99)
      @plant3 = Plant.create!(name: 'Carrot', description: 'Crunchy', days_to_harvest: 30)
      @plot1.plants << @plant1
      @plot1.plants << @plant2
      @plot2.plants << @plant2
      @plot2.plants << @plant3

      expect(@garden.unique_plants_under_100_days).to eq([@plant2, @plant3])
    end
  end
end
