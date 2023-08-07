class PlotPlantsController < ApplicationController 

  def destroy
    @plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:plant_id])
    @plot.plants.destroy(plant)  
    redirect_to plots_path, notice: 'Plant removed successfully.'
  end

  
end