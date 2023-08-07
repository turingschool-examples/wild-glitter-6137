class PlotsController < ApplicationController
  def index
    @plots = Plot.all.includes(:plants)
  end
end