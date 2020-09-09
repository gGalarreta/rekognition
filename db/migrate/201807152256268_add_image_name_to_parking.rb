class AddImageNameToParking < ActiveRecord::Migration[5.2]
  def change
    remove_column :parking_lots, :image_url
    remove_column :parking_levels, :image_url
    remove_column :park_zones, :image_url

    add_column :parking_lots, :url_image, :string
    add_column :parking_levels, :url_image, :string
    add_column :park_zones, :url_image, :string
  end
end
