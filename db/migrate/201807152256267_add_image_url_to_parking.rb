class AddImageUrlToParking < ActiveRecord::Migration[5.2]
  def change
    remove_column :parking_lots, :image
    remove_column :parking_levels, :image
    remove_column :park_zones, :image

    add_column :parking_lots, :image_url, :string
    add_column :parking_levels, :image_url, :string
    add_column :park_zones, :image_url, :string
  end
end
