class AddAttachmentParkingLot < ActiveRecord::Migration[5.2]
  def change
    remove_column :parking_lots, :image
    add_attachment :parking_lots, :image
  end
end
