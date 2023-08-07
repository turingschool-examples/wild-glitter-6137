class PlotsController < ApplicationController
  def index
    @plots = Plot.includes(plant_plots: :plant).all
  end
end
