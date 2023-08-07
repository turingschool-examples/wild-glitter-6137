class Plant < ApplicationRecord
  has_and_belongs_to_many :plots
  has_many :gardens, through: :plots
end
