class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  def self.fast_plants(garden_id)
    joins(plots: :garden)
      .where('plots.garden_id = ?', garden_id)
      .where('plants.days_to_harvest < ?', 100)
      .distinct
  end
end