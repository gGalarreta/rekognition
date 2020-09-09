class AddBannerToStore < ActiveRecord::Migration[5.2]
  def change
    add_attachment :stores, :banner
  end
end
