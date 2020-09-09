class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.date        :initial_date
      t.date        :final_date
      t.string      :value
      t.boolean     :only_mobile
      t.belongs_to  :store
      t.timestamps
    end
  end
end
