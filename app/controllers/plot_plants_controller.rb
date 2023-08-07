class PlotPlantsController < ApplicationController
  before_action :set_plot_plant, only: :destroy
  
  def destroy
    PlotPlant.destroy(@plot_plant.id)

    redirect_to plots_path
  end

  private

  def set_plot_plant
    @plot_plant = PlotPlant.find(params[:id])
  end
end