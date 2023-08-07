class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @unique_fast_growing_plants = @garden.plants.where('days_to_harvest < ?', 100).distinct
  end
end