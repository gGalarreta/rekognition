class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date    :initial_date
      t.date    :final_date
      t.string  :name
      t.string  :description
      t.timestamps
    end
  end
end
