class GardensController < ApplicationController

  def show
    @garden = Garden.find(params[:id])
    @sorted_plants = @garden.plant_occurences
  end
end