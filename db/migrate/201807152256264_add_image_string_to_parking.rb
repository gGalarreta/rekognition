class AddImageStringToParking < ActiveRecord::Migration[5.2]
  def change
     add_column :parking_lots, :image, :string
     add_column :parking_levels, :image, :string
     add_column :park_zones, :image, :string
  end
end
