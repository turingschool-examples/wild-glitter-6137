class Garden < ApplicationRecord
   has_many :plots

   def plants_under_100
      plots.joins(:plants).where("plants.days_to_harvest < 100").select("plants.name, plants.id").distinct.pluck(:name)
   end
end