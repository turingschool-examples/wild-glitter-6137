require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    it { should have_many(:plant_plots) }
    it { should have_many(:plots).through(:plant_plots) }
  end

  describe 'validations' do
    it 'requires a name' do
      plant = Plant.new(name: nil)
      expect(plant.valid?).to be(false)
      expect(plant.errors[:name]).to include("can't be blank")
    end
  end
end
