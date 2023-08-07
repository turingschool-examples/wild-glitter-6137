require 'rails_helper'

RSpec.describe Plot, type: :model do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:plant_plots) }
    it { should have_many(:plants).through(:plant_plots) }
  end

  describe 'instance methods' do
    before :each do
      load_test_data
    end
    describe '#plants_with_data' do
      it 'returns an array of hashes with plant details and its associated plant_plot_id' do
        expected_data = [
          {
            plant: @plant1,
            plant_plot_id: PlantPlot.find_by(plant: @plant1, plot: @plot1).id
          },
          {
            plant: @plant2,
            plant_plot_id: PlantPlot.find_by(plant: @plant2, plot: @plot1).id
          },
          {
            plant: @plant4,
            plant_plot_id: PlantPlot.find_by(plant: @plant4, plot: @plot1).id
          }
        ]

        result = @plot1.plants_with_data
        expected_data.each do |hash|
          expect(result).to include(hash)
        end
      end
    end
  end
end
