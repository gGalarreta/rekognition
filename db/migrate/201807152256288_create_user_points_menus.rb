class CreateUserPointsMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :user_points_menus do |t|
      t.belongs_to :user
      t.belongs_to :points_menu
      t.timestamps
    end
  end
end
