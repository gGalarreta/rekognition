class AddFieldsToMallLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :mall_levels, :image_width, :integer
    add_column :mall_levels, :image_height, :integer
  end
end
