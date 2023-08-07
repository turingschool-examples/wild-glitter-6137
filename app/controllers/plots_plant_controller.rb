class PlotsPlantController < ApplicationController
  def destroy
    plot_plant = PlotPlant.find_by(plot_id: params[:plot_id], plant_id:  params[:id])

    plot_plant.destroy

    redirect_to plots_path
  end
end