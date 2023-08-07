class Garden < ApplicationRecord
   has_many :plots
   has_many :plant_plots, through: :plots
   has_many :plants, through: :plant_plots


   def plant_occurances

      #require 'pry'; binding.pry
      plants.joins(:plant_plots).select('plants.*, COUNT(plant_plots.id) AS occurrences').group('plants.id').order('occurrences DESC')

   end
end