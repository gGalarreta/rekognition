class MapLabel < ApplicationRecord

  belongs_to :parking_lot
  belongs_to :parking_level

  # This method associates the attribute ":logo" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search params
    map_labels = MapLabel.
        where(parking_lot_id: params[:parking_lot_id]).
        where(parking_level_id: params[:parking_level_id])
  end

end
