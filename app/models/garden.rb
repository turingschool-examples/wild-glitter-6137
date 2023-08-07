class Garden < ApplicationRecord
   has_many :plots
   has_many :plants, through: :plots


   def plant_list
      plants
      .select("plants.*")
      .where("plants.days_to_harvest < 100")
      .distinct
   end


# User Story 4 same method just adding to it 
   # def plant_list
   #    plants
   #    .select("COUNT(plants.name) AS plant_count, plants.*")
         # count returns a hshh -> sort by the values in the hash?
         # 

   #    .where("plants.days_to_harvest < 100")
   #    .order("plant_count")
   #    .distinct
   # end
end