class Plant < ApplicationRecord
  has_many :plants_plots
  has_many :plots, through: :plants_plots
end