class Plot < ApplicationRecord
  validates_presence_of :number,
                        :size,
                        :direction
  belongs_to :garden
  has_many :plot_plants
  has_many :plants, through: :plot_plants
end