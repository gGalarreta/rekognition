class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.integer     :category
      t.string      :description
      t.integer     :state
      t.belongs_to  :user
      t.timestamps
    end
  end
end
