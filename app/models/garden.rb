class Garden < ApplicationRecord
  has_many :plots
  def unique_plants_under_100_days
    Plant.joins(plant_plots: { plot: :garden })
         .where(gardens: { id: })
         .where('plants.days_to_harvest < ?', 100)
         .distinct
  end
end
