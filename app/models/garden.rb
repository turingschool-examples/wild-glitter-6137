class Garden < ApplicationRecord
   has_many :plots
   has_many :plants, through: :plots

   def fast_growing_plants
      plants.distinct.where("days_to_harvest < ?", 100)
   end
end