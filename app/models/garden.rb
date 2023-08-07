class Garden < ApplicationRecord
   has_many :plots
   has_many :plants, through: :plots

   def unique_plants
      plants.joins(plots: :plot_plants)
            .where('days_to_harvest < 100')
            .distinct
   end
end