require "rails_helper"

RSpec.describe Plot, type: :model do
  describe "validations" do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:direction) }
  end

  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many :plot_plants }
    it { should have_many(:plants).through(:plot_plants) }
  end
end