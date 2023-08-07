class Garden < ApplicationRecord
   has_many :plots # provided by setup

   has_many :plants, through: :plots


   def plants_list
      self.plants.where('days_to_harvest < ?', 100).distinct
   end
end
