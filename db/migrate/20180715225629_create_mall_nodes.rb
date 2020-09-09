class CreateMallNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :mall_nodes do |t|
      t.references    :map, foreign_key: { to_table: :maps }
      t.references    :mall_level, foreign_key: { to_table: :mall_levels }
      t.column        'location', 'point'
      t.timestamps
    end
  end
end
