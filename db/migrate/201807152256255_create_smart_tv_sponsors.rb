class CreateSmartTvSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :smart_tv_sponsors do |t|
      t.string      :video_url
      t.attachment  :image_frame
      t.timestamps
    end
  end
end
