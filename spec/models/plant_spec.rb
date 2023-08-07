require "rails_helper"

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    it { should have_and_belong_to_many(:plots) }
    it { should have_many(:gardens).through(:plots) }
  end
end
