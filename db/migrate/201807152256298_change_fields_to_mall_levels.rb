class ChangeFieldsToMallLevels < ActiveRecord::Migration[5.2]
  def change
    remove_column :mall_levels, :location

    add_column :mall_levels, :location, 'point', array: true, default: []
  end
end
