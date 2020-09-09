class AddAttachmentParkingLevel < ActiveRecord::Migration[5.2]
  def change
    remove_column :parking_levels, :image
    add_attachment :parking_levels, :image
  end
end
