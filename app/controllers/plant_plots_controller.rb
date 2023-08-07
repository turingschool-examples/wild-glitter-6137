class PlantPlotsController < ApplicationController

    def destroy
        PlantPlot.find(params[:id]).destroy
    end

end