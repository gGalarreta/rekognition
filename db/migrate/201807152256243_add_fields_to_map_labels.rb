
require_relative '20180425002431_create_map_labels'

class AddFieldsToMapLabels < ActiveRecord::Migration[5.2]
  def change

    revert CreateMapLabels

    create_table(:map_labels) do |t|
      t.references    :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references    :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.text          :description
      t.float         :x_coord
      t.float         :y_coord
      t.string        :image, null: true
    end
  end
end
