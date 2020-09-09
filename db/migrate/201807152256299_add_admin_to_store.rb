class AddAdminToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :admin_id, :integer, null: true
  end
end
