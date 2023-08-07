class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  # def destroy
  #   @plant = PlantPlot.find(params[:id])
  #   @plant.destroy
  #   redirect_to plots_path
  # end
end