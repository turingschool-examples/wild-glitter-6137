class Garden < ApplicationRecord
   has_many :plots

# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take less than 100 days to harvest

   def unique_plants
      plots.joins(:plants).where('plants.days_to_harvest < ?', 100).distinct.pluck(:name)
   end
end