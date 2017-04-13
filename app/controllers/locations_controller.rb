require "httparty"

class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new(location_params)
    puts @location
  end

  def locations_params
    params.require(:location).permit(:address)
  end

  def search
    if params[:address].present?
      geocoder = Geocoder.search(params[:address])
      @search_result_address = geocoder[0].formatted_address

      location = geocoder[0].geometry['location']
      @candidate_hash = Location.candidate_list(location)
    end
  end

end
