class PlantPlotsController < ApplicationController
  def destroy
    plant_plots = PlantPlot.find_by(plant_id: params[:id], plot_id:  params[:plot_id])
    plant_plots.delete
    redirect_to plots_path
  end
end