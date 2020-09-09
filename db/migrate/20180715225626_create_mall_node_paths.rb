class CreateMallNodePaths < ActiveRecord::Migration[5.2]
  def change
    create_table :mall_node_paths do |t|
      t.integer       :mall_node_id_first, primary: true
      t.integer       :mall_node_id_second, primary: true
      t.references    :map, foreign_key: { to_table: :maps }
      t.integer       :weight
      t.timestamps
    end
  end
end
