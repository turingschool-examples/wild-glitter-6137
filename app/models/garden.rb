class Garden < ApplicationRecord
   has_many :plots
   has_many :plants, through: :plots

   def sub_100_to_harvest
    plants.where("days_to_harvest < ?", 100).distinct
   end
end