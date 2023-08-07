class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  
  # Instance Methods
  def plants_with_quick_harvest
    plants.where('days_to_harvest < 100')
      .distinct
      .pluck(:name)
  end

  def sorted_list_of_flowers
    plants.group(:name)
      .order('COUNT(plants.id) DESC')
      .pluck('name')
  end
end