require "rails_helper"

RSpec.describe Garden, type: :model do
  before(:each) do
    @garden1 = Garden.create!(name: "Turing Community Garden", organic: true)

    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 15, size: "Medium", direction: "West")
    @plot3 = @garden1.plots.create!(number: 10, size: "Small", direction: "East")


    @plant1 = @plot1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant2 = @plot1.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
    @plant3 = @plot1.plants.create!(name: "Onion", description: "A Onion description.", days_to_harvest: 30)

    @plant4 = @plot2.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
    @plant5 = @plot2.plants.create!(name: "Tomato", description: "A Tomato description.", days_to_harvest: 120)
    @plant6 = @plot2.plants.create!(name: "Sqaush", description: "A Squash description.", days_to_harvest: 45)

    @plant7 = @plot3.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
    @plant8 = @plot3.plants.create!(name: "Celery", description: "A celery description.", days_to_harvest: 130)
    @plant9 = @plot3.plants.create!(name: "Garlic", description: "A garlic description.", days_to_harvest: 25)
  end

  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe '#instance methods' do
    describe 'plants_under_100' do
      it 'Returns a list of plants under 100 days to harvest from a garden' do
        expect(@garden1.plants_under_100).to eq(["Carrot", "Garlic", "Onion", "Purple Beauty Sweet Bell Pepper", "Sqaush"])
      end
    end
  end
end