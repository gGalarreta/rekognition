class CreatePointsMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :points_menus do |t|
      t.string    :name
      t.integer   :amount
      t.timestamps
    end
  end
end
