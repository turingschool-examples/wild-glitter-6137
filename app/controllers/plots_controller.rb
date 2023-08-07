class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def destroy
    @plant = PlantPlot.find(params[:plant_id])
    @plant.destroy
    redirect_to plots_path
    #I can't figure out this button :((
    #When I do @plot = Plot.find(params[:id]), it tells me
    #that it's a FK violation. That's why I've tried accessing my joins table here now. But it says it can't find a PlantPlot without an ID.... so I don't know
  end
end