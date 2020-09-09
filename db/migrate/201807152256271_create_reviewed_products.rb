class CreateReviewedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :reviewed_products do |t|
      t.belongs_to :user
      t.belongs_to :store_category
      t.timestamps
    end
  end
end
