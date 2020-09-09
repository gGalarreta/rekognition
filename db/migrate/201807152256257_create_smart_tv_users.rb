class CreateSmartTvUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :smart_tv_users do |t|
      t.integer     :user_tv, null: :false
      t.string      :password_tv, null: :false
      t.timestamps
    end
  end
end
