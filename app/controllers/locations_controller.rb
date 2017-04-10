require "httparty"

class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def search
    if params[:address].present?
      currentPlace = params[:address]
      @inputaddress = currentPlace

      ## 1. 出発地点と目的地点の設定
      currentPlaceLat = Geocoder.search(currentPlace)[0].geometry["location"]["lat"]
      currentPlaceLon = Geocoder.search(currentPlace)[0].geometry["location"]["lng"]

      candidateList = {}
      locations = Location.all

      locations.each do |n|
        familyaddress = n.address
        destinationLat = n.latitude
        destinationLon = n.longitude

        ## 2. 二点間の距離計算
        y1 = currentPlaceLat * Math::PI / 180
        x1 = currentPlaceLon * Math::PI / 180
        y2 = destinationLat * Math::PI / 180
        x2 = destinationLon * Math::PI / 180
        earth_r = 6378140

        deg = Math::sin(y1) * Math::sin(y2) + Math::cos(y1) * Math::cos(y2) * Math::cos(x2 - x1)
        distance = earth_r * (Math::atan(-deg / Math::sqrt(-deg * deg + 1)) + Math::PI / 2) / 1000

        candidateList.store(familyaddress, distance)
      end
      @candidateList= candidateList.sort {|(k1, v1), (k2, v2)| v1 <=> v2 }
    end
  end
end
