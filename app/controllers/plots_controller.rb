class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  private
  def plot_params
    params.require(:plot).permit(:number, :size, :direction)
  end
end