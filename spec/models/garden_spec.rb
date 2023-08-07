require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plot_plants).through(:plots) }
    it { should have_many(:plants).through(:plot_plants) }
  end

  describe 'instance methods' do
    before do
      load_test_data
    end
    describe "#quick-growing" do
      it "can return a list of unique plants in garden which can be harvested in under 100 days" do
        expect(@garden_1.quick_growing).to match_array([@plant_7, @plant_8, @plant_3, @plant_4])
        expect(@garden_2.quick_growing).to match_array([@plant_8, @plant_3])
      end
    end
  end
end