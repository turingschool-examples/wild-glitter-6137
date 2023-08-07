require 'rails_helper'

RSpec.describe PlotPlant, type: :model do
  describe 'Associations' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }
  end

  describe 'Validations' do
    # it { should validate_presence_of :example }
  end
end