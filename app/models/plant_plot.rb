class PlantPlot < ApplicationRecord
  belongs_to :plot
  belong_to :plant
end