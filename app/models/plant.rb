class Plant < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :days_to_harvest
  has_many :plot_plants
  has_many :plots, through: :plot_plants
end