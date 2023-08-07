class PlantsController < ApplicationController
  def destroy
    @plant = Plant.find_by(id: params[:id])
    
    if @plant
      @plot = Plot.find_by(id: params[:plot_id])

      if @plot
        @plot.plants.delete(@plant)
        redirect_to plots_path
      else
        redirect_to plots_path
      end
    else
      redirect_to plots_path
    end
  end
end