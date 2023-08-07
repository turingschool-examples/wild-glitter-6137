require "rails_helper"

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    it { should have_and_belong_to_many(:plots) }
  end
end
