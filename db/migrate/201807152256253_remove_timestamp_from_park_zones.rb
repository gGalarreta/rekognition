class RemoveTimestampFromParkZones < ActiveRecord::Migration[5.2]
  def change
    remove_column :park_zones, :created_at, :datetime
    remove_column :park_zones, :updated_at, :datetime
  end
end
