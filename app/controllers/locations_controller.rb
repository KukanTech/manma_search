require "httparty"

class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def search
    if params[:address].present?
      address = params[:address]
      @inputaddress = address

      ## 1. 出発地点と目的地点の設定
      @currentPlaceLat = Geocoder.search(address)[0].geometry["location"]["lat"]
      @currentPlaceLon = Geocoder.search(address)[0].geometry["location"]["lng"]

      @locations = Location.all
    end
  end

end
