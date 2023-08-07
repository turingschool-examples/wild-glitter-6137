class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plant_plots
  has_many :plants, through: :plant_plots

  def plants_with_data
    plant_plots.includes(:plant).map do |plant_plot|
      {
        plant: plant_plot.plant,
        plant_plot_id: plant_plot.id
      }
    end
  end
end
