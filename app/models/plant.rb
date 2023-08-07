class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  validates :name, presence: true
end
