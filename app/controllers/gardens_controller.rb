class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @quick_harvest = @garden.plants_with_quick_harvest
  end
end