class Plant < ApplicationRecord
  has_many :gardens, through: :plots
  has_many :plant_plots
  has_many :plots, through: :plant_plots
end
