class Plant < ApplicationRecord
  has_and_belongs_to_many :plots
end
