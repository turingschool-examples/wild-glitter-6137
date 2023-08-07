class PlantPlotsController < ApplicationController

    def destroy
        # binding.pry;
        PlantPlot.find_by(plant_id: params[:id],plot_id: params[:plot_id]).destroy
    end

end