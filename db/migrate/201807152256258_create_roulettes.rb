class CreateRoulettes < ActiveRecord::Migration[5.2]
  def change
    create_table :roulettes do |t|
      t.belongs_to :user
      t.belongs_to :smart_tv_sponsor
      t.timestamps
    end
  end
end
