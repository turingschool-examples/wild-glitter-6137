class Garden < ApplicationRecord
  validates_presence_of :name
  validates :organic, inclusion: { in: [true, false] }, exclusion: nil

  has_many :plots

  def plants_less_than_100
    result = Array.new
  
    plots.each do |plot|
      early_plant_names = plot.plants.where("days_to_harvest < ?", 100).pluck(:name)
      result.concat(early_plant_names)
    end
  
    result
  end
end