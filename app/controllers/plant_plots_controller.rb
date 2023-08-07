class PlantPlotsController < ApplicationController
  def destroy
    PlantPlot.find(params[:id]).destroy
    redirect_to plots_path
  end
end
