class AddAttachmentParkingZone < ActiveRecord::Migration[5.2]
  def change
    remove_column :park_zones, :image
    add_attachment :park_zones, :image
  end
end
