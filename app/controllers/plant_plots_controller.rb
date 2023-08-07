class PlantPlotsController < ApplicationController
  
  def destory
    
    plant_plot = PlantPlot.find_by(plot_id: params[:format], plant_id: params[:id])

    plant_plot.delete

    redirect_to "/plots"
  end
end