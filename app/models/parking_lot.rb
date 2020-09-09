class ParkingLot < ApplicationRecord

  include ImageHelper

  # This method associates the attribute ":logo" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  has_many :parking_levels
  has_many :park_zones_road_dots
  has_many :park_zone_dots

  def self.calculate_states id
    occupieds = ParkingPlace.includes(:parking_lot).where("parking_places.parking_lot_id=? and (parking_places.state=0 or parking_places.state=2)", id).references(:parking_lot).count
    frees = ParkingPlace.includes(:parking_lot).where("parking_places.parking_lot_id=? and parking_places.state=1", id).references(:parking_lot).count
    return [frees, occupieds]
  end

  def self.calculate_all_states elements
    states = Array.new
    elements.each do |element|
      states.push(self.calculate_states element.id)
    end
    states
  end

  def initialize_image params
    encoded_data = params[:data]
    content_type = params[:content_type]
    image_name = params[:filename]
    image = Paperclip::DataUriAdapter.new("data:#{content_type};base64,#{encoded_data}")
    image.original_filename = image_name
    self.image = image
    self
  end
  
end
