class Plot < ApplicationRecord
   belongs_to :garden  # provided by setup

   has_many :plot_plants
   has_many :plants, through: :plot_plants
end