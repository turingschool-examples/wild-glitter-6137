class PlotsController < ApplicationController

  def index
    @plots = Plot.all
  end

  def destroy

  end
end
