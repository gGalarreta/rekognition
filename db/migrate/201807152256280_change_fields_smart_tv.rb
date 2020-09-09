class ChangeFieldsSmartTv < ActiveRecord::Migration[5.2]
  def change
    
    remove_column :smart_tv_users, :user_tv
    remove_attachment :smart_tv_sponsors, :image_frame

    add_column :smart_tv_users, :user_tv, :string
    add_column :smart_tv_sponsors, :name, :string
    add_column :smart_tv_sponsors, :image_frame, :string


  end
end
