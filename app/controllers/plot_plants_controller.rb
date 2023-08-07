class PlotPlantsController < ApplicationController
  before_action :find_plot_and_plant, only: [:destroy]

  def destroy
    @plot_plant.destroy
    redirect_to plots_path
  end

  private

  def find_plot_and_plant
    @plot = Plot.find(params[:plot_id])
    @plant = Plant.find(params[:id])
    @plot_plant = PlotPlant.find_by(plant: @plant, plot: @plot)
  end
end