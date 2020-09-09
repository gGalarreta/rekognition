class CreateBackgroundColors < ActiveRecord::Migration[5.2]
  def change
    create_table :background_colors do |t|
      t.string      :hexadecimal_color
      t.string      :description
      t.belongs_to  :smart_tv_sponsor
      t.timestamps
    end
  end
end
