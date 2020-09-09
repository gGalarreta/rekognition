class ParkingPlace < ApplicationRecord
  belongs_to :parking_level
  belongs_to :parking_lot
  belongs_to :park_zone, required: false

  has_many :sensor_maintenance

  def self.search params
    parking_places = ParkingPlace.where(parking_lot_id: params[:parking_lot_id]).where(parking_level_id: params[:parking_level_id]).where(park_zone_id: params[:park_zone_id])
  end
end
