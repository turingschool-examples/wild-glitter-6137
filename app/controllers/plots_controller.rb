class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def remove_plant
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:plant_id])
    plot.plants.delete(plant)
    redirect_to "/plots", notice: "Plant removed from plot."
  end
end