class CreateUserPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :user_places do |t|
      t.references  :user, primary: true, foreign_key: { to_table: :users }
      t.references  :parking_place, primary: true, foreign_key: { to_table: :parking_places }
      t.references  :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references  :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.date        :start_time
    end
  end
end
