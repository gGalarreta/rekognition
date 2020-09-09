class SensorLog < ApplicationRecord

  require 'rest-client'
  require 'json'

  def self.test
    #url = 'http://localhost/wssmartparking.php'
    url = 'http://10.100.202.235/tabla.php'
    response = JSON.parse(RestClient::Request.execute(method: :get, url: url, timeout: 10))
    p '================================'
    p response
    response["sensores"].each do |sensor|
      parking_place = ParkingPlace.where(sensor_id: sensor["slot"])
      unless parking_place.empty?
        user_place = UserPlace.where(parking_place_id: parking_place.first.id)
        p parking_place.first
        unless user_place.empty?
          User.where(id:user_place.last.user_id).update(flag_park: 0)
          parking_place.first.update(state: sensor["estado"])
        end
      end
    end
  end
end
