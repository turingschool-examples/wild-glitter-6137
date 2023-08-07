require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe "methods" do
    before(:each) do
      test_data
    end
    it "takes a unique list of plants in a plot that take less than 100 days to grow" do
      expect(@garden_2.plant_list.first.name).to eq("String Bean")
    end
  end
end