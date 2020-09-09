class UserPlace < ApplicationRecord

  include DateHelper

  def self.search params
    user_places = UserPlace.where(user_id: params[:user_place_id])
  end
 
  def self.new_user_place params
    user = User.find_by(id: params[:user_id])
    user.update(flag_park: 1)

    temp = ParkingPlace.where(id: params[:parking_place_id])[0]
    user_place = UserPlace.new params
    user_place.parking_lot_id = temp.parking_lot_id
    user_place.parking_level_id = temp.parking_level_id
    user_place.start_time = DateTime.now
    user_place
  end
end
