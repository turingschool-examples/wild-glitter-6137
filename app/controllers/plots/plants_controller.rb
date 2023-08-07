class Plots::PlantsController < ApplicationController
  def remove
    @plot = Plot.find(params[:plot_id])
    @plant = Plant.find(params[:id])
    @plot.plants.delete(@plant)
    redirect_to plots_path
  end
end