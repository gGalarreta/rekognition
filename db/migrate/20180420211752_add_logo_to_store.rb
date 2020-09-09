class AddLogoToStore < ActiveRecord::Migration[5.2]
  def change
    add_attachment :stores, :logo
  end
end
