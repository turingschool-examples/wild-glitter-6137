class Garden < ApplicationRecord
   has_many :plots # provided by setup

   has_many :plants, through: :plots
end