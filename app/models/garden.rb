class Garden < ApplicationRecord
   has_many :plots

   def plant_list
      Plant.select("name, days_to_harvest").joins(:plant_plots).where("days_to_harvest < 100").order("days_to_harvest").distinct
   end
end