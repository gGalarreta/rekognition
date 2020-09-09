class AddLoginWithFbToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_with_fb, :boolean, default: false
    add_column :users, :login_with_gmail, :boolean, default: false
  end
end
