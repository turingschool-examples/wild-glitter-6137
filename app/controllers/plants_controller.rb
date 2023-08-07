class PlantsController < ApplicationController
  def destroy
    # this method currently expects a plot_id to be passed in as a parameter
    # depending on future functionality, I may need to change this
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:id])
    plot.plants.destroy(plant)
    redirect_to plots_path
  end
end
