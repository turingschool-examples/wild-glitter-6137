require "rails_helper"

RSpec.describe Garden, type: :model do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots)}
  end

  describe "instance methods" do 
    before(:each) do 
      @garden1 = Garden.create!(name: "Stardew Garden", organic: true)

      @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
      @plot2 = @garden1.plots.create!(number: 15, size: "Small", direction: "West")
      
      @plant5 = @plot1.plants.create!(name: "Parsnip", description: "Has an earthy taste", days_to_harvest: 50)
      @plant1 = @plot1.plants.create!(name: "Starfruit", description: "A fruit that grows in hot, humid weather", days_to_harvest: 90)
      @plant2 = @plot1.plants.create!(name: "Kale", description: "Great in soups and stir frys", days_to_harvest: 105)

      @plant3 = @plot2.plants.create!(name: "Parsnip", description: "Has an earthy taste", days_to_harvest: 50)
      @plant4 = @plot2.plants.create!(name: "Hops", description: "Used to flavor beer", days_to_harvest: 110)
    end
    describe ".unique_plants_list" do 
      it 'can return a unique list of plant names that are in a garden depending on cultivation length' do 

        expected_plants = [@plant5.name, @plant1.name]
        expect(@garden1.unique_plants_list.pluck(:name)).to eq(expected_plants)
        expect(@garden1.unique_plants_list.count).to eq(2)
      end
    end
  end
end