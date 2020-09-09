class ParkZoneDot < ApplicationRecord
  belongs_to :park_zone
  belongs_to :parking_level
  belongs_to :parking_lot

  def self.search_by_level params
    park_zone_dot = ParkZoneDot.where(parking_level_id: params[:park_zone_dot_id])
    park_zone_dot
  end
end
