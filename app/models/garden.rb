class Garden < ApplicationRecord
   has_many :plots
   has_many :plants, through: :plots

   def unique_plants_sub_100
      plants
        .where('days_to_harvest < ?', 100)
        .distinct
        .pluck(:name)
   end
end