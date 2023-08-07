class Garden < ApplicationRecord
  validates_presence_of :name
  validates :organic, inclusion: { in: [true, false] }, exclusion: nil

  has_many :plots
end