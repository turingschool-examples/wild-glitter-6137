class PlantPlotsController < ApplicationController
  def destroy
    plant_plot = PlantPlot.find_by(plant_id: params[:id], plot_id: params[:plot_id])
    plant_plot.delete
    redirect_to "/plots"
  end

end