class Plot < ApplicationRecord
   belongs_to :garden
   has_and_belongs_to_many :plants
end
