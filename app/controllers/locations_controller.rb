require "httparty"

class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def search
    if params[:address].present?
      address = params[:address]

      ## 1. 出発地点と目的地点の設定
      currentPlaceLat = Geocoder.search(address)[0].geometry["location"]["lat"]
      currentPlaceLon = Geocoder.search(address)[0].geometry["location"]["lng"]

      destinationLat = 35.710063
      destinationLon = 139.8107

      ## 2. OSRM APIへアクセスし、結果を取得
      endpointUrl = "http://router.project-osrm.org/route/v1/driving/#{currentPlaceLon},#{currentPlaceLat};#{destinationLon},#{destinationLat}"
      response =  HTTParty.get(URI.encode(endpointUrl))

      ## 3. 取得した結果を出力
      puts "所要時間：#{response["routes"][0]["duration"]}秒"
      puts "距離：#{response["routes"][0]["distance"]}m"

    end
  end

end
