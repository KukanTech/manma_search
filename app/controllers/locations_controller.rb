require "httparty"

class LocationsController < ApplicationController

  def index
    @locations = Location.all
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
