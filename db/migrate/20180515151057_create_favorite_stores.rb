class CreateFavoriteStores < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_stores do |t|
      t.belongs_to  :user
      t.belongs_to  :store
      t.timestamps
    end
  end
end
