class CreateMallElements < ActiveRecord::Migration[5.2]
  def change
    create_table :mall_elements do |t|
      t.references    :mall_level,  foreign_key: { to_table: :mall_levels }
      t.references    :store, foreign_key: { to_table: :stores }
      t.references    :map, foreign_key: { to_table: :maps }
      t.string        :type
      t.column        'access_points', 'point', array: true, default: []
      t.column        'limit_points', 'point', array: true, default: []
      t.timestamps
    end
  end
end
