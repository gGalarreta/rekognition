class CreateSponsorStores < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsor_stores do |t|
      t.belongs_to :store
      t.belongs_to :smart_tv_sponsor
      t.timestamps
    end
  end
end
