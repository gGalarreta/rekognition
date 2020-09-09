class AddSpanishNameToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :points_menus, :spanish_name, :string
  end
end
