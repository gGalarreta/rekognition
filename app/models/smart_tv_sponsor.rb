class SmartTvSponsor < ApplicationRecord
  
  has_one :background_color
  has_one :smart_tv_user
  has_many :roulettes
  has_many :users, through: :roulettes
  has_many :sponsor_stores
  has_many :stores, through: :sponsor_stores
  has_many :user_sponsors
  has_many :smart_tv_users, through: :user_sponsors

  accepts_nested_attributes_for :background_color


  def self.valid_stores stores
    all_stores_id = Store.all.map(&:id)
    (all_stores_id & stores) == stores
  end

  def add_stores_and_save stores
    stores = stores.map(&:to_i)
    if self.valid? and SmartTvSponsor.valid_stores stores
      self.stores << Store.where(id: stores)
      self.save
    else
      false
    end
  end

  def self.get_promotion_products params
    smart_tv_sponsor_id = params[:smart_tv_sponsor_id]
    promotions_number = params[:promotions_number]
    smart_tv_sponsor = SmartTvSponsor.find smart_tv_sponsor_id
    stores = smart_tv_sponsor.stores.map(&:id)
    products = Product.joins("INNER JOIN stores ON products.store_id = stores.id").where(store_id: stores).order('random()').limit(promotions_number)
  end
end
