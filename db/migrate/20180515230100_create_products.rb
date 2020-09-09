class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name
      t.belongs_to :brand
      t.belongs_to :product_category
      t.belongs_to :store
      t.belongs_to :promotion
      t.timestamps
    end
  end
end
