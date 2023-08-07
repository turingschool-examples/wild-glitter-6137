require 'rails_helper'

RSpec.describe Garden, type: :model do
  before :each do
    load_test_data
  end

  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    describe '#unique_plants_under_100_days' do
      it 'displays a list of plants that are included in that gardens plots and are unique and take less than 100 days to harvest' do
        # Set a variable to hold the expected plants
        expected_plants = [@plant1, @plant3]

        # Call the method
        plants = @garden1.unique_plants_under_100_days

        # Verify the expected plants are returned
        expected_plants.each do |plant|
          expect(plants).to include(plant)
        end

        # Verify the plants are unique
        expect(plants.uniq.count).to eq(plants.count)

        # Ensure plants over 100 days are not included
        expect(plants).not_to include(@plant2)
        expect(plants).not_to include(@plant4)
      end
    end
  end
end
