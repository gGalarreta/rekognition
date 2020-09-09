class CreateFavoriteProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_products do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.timestamps
    end
  end
end
