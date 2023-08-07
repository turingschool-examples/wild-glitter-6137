class Garden < ApplicationRecord
   has_many :plots
   has_many :plant_plots, through: :plots
   has_many :plants, through: :plant_plots


   def plant_occurences
      plants.joins(:plant_plots)
      .where('plants.days_to_harvest < ?', 100).select('plants.*, COUNT(DISTINCT plant_plots.plot_id) AS occurrences').group('plants.id').order('occurrences DESC')
   end
end

#require 'pry'; binding.pry
      #Plant.joins(:plant_plots).select('plants.*, COUNT(plant_plots.id) AS occurrences')
      #require 'pry'; binding.pry

        #plots.joins(:plants)


#require 'pry'; binding.pry
      #plants.joins(plots: :plants).select('plants.*, COUNT(plots.id) AS occurrences').group('plants.id').order('occurrences DESC')

      
      # plants.joins(:plant_plots).where('plant_plots.plot_id = plots.id').select('plants.*, COUNT(plant_plots.id) AS occurrences').group('plants.id').order('occurrences DESC')