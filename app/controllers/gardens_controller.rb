class GardensController < ApplicationController
  before_action :set_garden, only: :show
  
  def show
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end
end