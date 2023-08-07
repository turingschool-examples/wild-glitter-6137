require "rails_helper"

RSpec.describe Garden, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should allow_value(%w(true false)).for(:organic) }
  end

  describe 'relationships' do
    it { should have_many(:plots) }
  end
end