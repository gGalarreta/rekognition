class CreateTechnicalSpecifications < ActiveRecord::Migration[5.2]
  def change
    create_table :technical_specifications do |t|
      t.string  :description
      t.string  :weight
      t.string  :length
      t.string  :height
      t.string  :brand
      t.belongs_to :product
      t.timestamps
    end
  end
end
