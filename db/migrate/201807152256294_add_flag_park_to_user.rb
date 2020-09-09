class AddFlagParkToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :flag_park, :integer
  end
end
