class Store < ApplicationRecord

  include ImageHelper
  
  has_many :store_store_categories
  has_many :store_categories, through: :store_store_categories, dependent: :destroy
  has_many :favorite_stores
  has_many :users, through: :favorite_stores
  has_many :products, dependent: :destroy
  has_many :promotions, dependent: :destroy
  has_many :store_events
  has_many :events, through: :store_events, dependent: :destroy
  has_many :sponsor_stores
  has_many :smart_tv_sponsors, through: :sponsor_stores

  # This method associates the attribute ":logo" with a file attachment
  has_attached_file :logo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  # This method associates the attribute ":banner" with a file attachment
  has_attached_file :banner, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  def self.search params
    stores = Store.
      search_by_category(params[:store_category]).
      search_by_name(params[:name]).
      search_by_webpage(params[:webpage])
  end

  def self.search_by_category store_category
    if store_category.present?
      stores = Store.joins("INNER JOIN store_store_categories ON stores.id = store_store_categories.store_id").where("store_store_categories.store_category_id IN (?) ", store_category.split(","))
      if stores.nil?
        Store.none
      else
        stores
      end
    else
      all
    end
  end

  def self.search_by_name store_name
    if store_name.present?
      where(name: store_name)
    else
      all
    end
  end

  def self.search_by_webpage webpage_name
    if webpage_name.present?
      where(webpage: webpage_name)
    else
      all
    end
  end

  def self.valid_store_categories store_categories
    if store_categories.present?
      all_store_categories_id = StoreCategory.all.map(&:id)
      (all_store_categories_id & store_categories) == store_categories
    end
  end


  def self.miss_valid params
    if params.class.to_s == "String"
      store_categories = [params.to_i]
    else
      store_categories = params.values().map(&:to_i)
    end
    store_categories
  end

  def add_categories_and_save store_params
    store_categories = store_params[:store][:store_categories][0].split(",").map(&:to_i)
    #store_categories = Store.miss_valid store_categories
    if self.valid?#and Store.valid_store_categories store_categories
      self.save
      self.store_categories << StoreCategory.where(id: store_categories)
    end
    self
  end

  def validate_categories_and_update store_params
    self.assign_attributes store_params
    #store_categories = store_params[:store_categories].values().map(&:to_i)
    store_categories = store_params[:store][:store_categories][0].split(",").map(&:to_i)
    if self.valid?# and Store.valid_store_categories store_categories
      self.store_categories.destroy_all
      self.store_categories << StoreCategory.where(id: store_categories)
    end
    self.save
  end

end
