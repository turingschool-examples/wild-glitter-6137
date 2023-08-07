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
      expect(@garden_1.plants_less_than_100).to match_array([@plant_1.name, @plant_2.name])
      expect(@garden_2.plants_less_than_100).to match_array([@plant_1.name, @plant_3.name])
      expect(@garden_3.plants_less_than_100).to match_array([@plant_1.name, @plant_2.name, @plant_3.name])
    end
  end
end