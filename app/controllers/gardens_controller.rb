class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @quick_harvest = @garden.plants_with_quick_harvest
    @sorted_flowers = @garden.sorted_list_of_flowers
  end
end