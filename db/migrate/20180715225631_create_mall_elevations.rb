class CreateMallElevations < ActiveRecord::Migration[5.2]
  def change
    create_table :mall_elevations do |t|
      t.references    :map, foreign_key: { to_table: :maps }
      t.references    :mall_level, foreign_key: { to_table: :mall_levels }
      t.references    :mall_node, foreign_key: { to_table: :mall_nodes }
      t.string        :name
      t.string        :type
      t.timestamps
    end
  end
end
