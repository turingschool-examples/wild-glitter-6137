class Garden < ApplicationRecord
  validates_presence_of :name
  validates :organic, inclusion: { in: [true, false] }, exclusion: nil

  has_many :plots
  has_many :plants, through: :plots

  def plants_less_than_100
    plants.where("days_to_harvest < ?", 100).distinct.pluck(:name)
  end
end