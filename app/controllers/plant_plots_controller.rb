class PlantPlotsController < ApplicationController
    def destroy
      @plot = Plot.find(params[:id])
      @plant = Plant.find(params[:id])
      @plant.destroy
      redirect_to plots_path
    end
end