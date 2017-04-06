class LocationsController < ApplicationController

  def nearby
    @locations = Location.near([params[:location][:latitude], params[:location][:longtitude]], 50)
  end

end
