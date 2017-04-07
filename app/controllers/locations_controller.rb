class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def search
    if params[:address].present?
      address = params[:address]
      puts address
      @latitude = Geocoder.search(address)[0].geometry["location"]["lat"]
      @longitude = Geocoder.search(address)[0].geometry["location"]["lng"]
    end
  end

end
