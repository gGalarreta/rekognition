class ParkZonesRoadDot < ApplicationRecord

  belongs_to :parking_level
  belongs_to :parking_lot
  belongs_to :road_dot
  belongs_to :park_zone, required: false
end
