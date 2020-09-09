class SensorMaintenance < ApplicationRecord
  belongs_to :parking_sensor
  belongs_to :parking_place
  belongs_to :parking_level
  belongs_to :parking_lot
end
