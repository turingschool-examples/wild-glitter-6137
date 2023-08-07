class GardensController  < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @plants_list = @garden.plants_list
  end
end