class Garden < ApplicationRecord
   has_many :plots
   has_many :plants, through: :plots

   def distinct_sub100_plants
      plants.where("days_to_harvest < 100").distinct
   end
end