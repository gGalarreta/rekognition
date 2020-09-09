class StoreCategory < ApplicationRecord

  include ImageHelper
  
  has_many :store_store_categories
  has_many :stores, through: :store_store_categories, dependent: :destroy
  has_many :preference_store_categories
  has_many :users, through: :preference_store_categories, dependent: :destroy


  # This method associates the attribute ":icon" with a file attachment
  has_attached_file :icon, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/


  def self.search params
    store_categories = StoreCategory.all.
      search_by_name(params[:name])
  end

  def self.search_by_name store_category_name
    if store_category_name.present?
      where(name: store_category_name)
    else
      all
    end
  end
end
