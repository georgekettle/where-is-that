class LocationsController < ApplicationController
  def show
  end

  def popup
    @location = Location.find(params[:id])
  end
end
