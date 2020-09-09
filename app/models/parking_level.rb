class ParkingLevel < ApplicationRecord

  include ImageHelper


  belongs_to :parking_lot
  has_many :park_zones
  has_many :parking_places
  has_many :map_labels
  has_many :park_zones_road_dots
  has_many :park_zone_dots


  # This method associates the attribute ":logo" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search params
    parking_levels = ParkingLevel.where(parking_lot_id: params[:parking_level_id])
    parking_levels
  end

  def self.calculate_states id
    occupieds = ParkingPlace.includes(:parking_level).where("parking_places.parking_level_id=? and (parking_places.state=0 or parking_places.state=2)", id).references(:parking_level).count
    frees = ParkingPlace.includes(:parking_level).where("parking_places.parking_level_id=? and parking_places.state=1", id).references(:parking_level).count
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
