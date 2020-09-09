class Product < ApplicationRecord

  DEFAULT_LIMIT = 10

  include ImageHelper

  has_one :technical_specification, dependent: :destroy
  belongs_to :product_category
  belongs_to :brand
  belongs_to :promotion, required: false
  
  belongs_to :store

  has_many :favorite_products
  has_many :users, through: :favorite_products

  accepts_nested_attributes_for :technical_specification, allow_destroy: true

    # This method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search params
    products = Product.
      search_by_category(params[:product_category]).
      search_by_price(params[:min_price], params[:max_price]).
      search_by_mobile_availability(params[:only_mobile]).
      search_by_name(params[:name]).
      search_by_store_category(params[:store_category])
  end

  def self.search_by_store_category store_category_param
    if store_category_param.present?
      store_category = StoreCategory.find(store_category_param)
      stores = store_category.stores
      if stores.nil?
        Product.none
      else
        products = Product.none
        stores.each do |store|
          products = products + Product.where(store_id: store)
        end
        if products.nil?
          Product.none
        else
          products
        end
      end
    else
      all
    end
  end

  def self.search_by_category product_categories
    if product_categories.present?
      products = Product.where(product_category: product_categories.split(","))
      if products.nil?
        Product.none
      else
        products
      end
    else
      all
    end
  end

  def self.search_by_name product_name
    if product_name.present?
      products = Product.where(name: product_name)
      if products.nil?
        Product.none
      else
        products
      end
    else
      all
    end
  end

  def self.search_by_price min_price, max_price
    if min_price.present? and max_price.present?
      products = Product.where("price >= ? AND price <= ? ", min_price, max_price)
      if products.nil?
        Product.none
      else
        products
      end
    else
      all
    end
  end

  def self.search_by_mobile_availability available
    if available.present?
      products = Product.joins("INNER JOIN promotions ON products.promotion_id = promotions.id").where("promotions.only_mobile = ?", available)
      if products.nil?
        Product.none
      else
        products
      end
    else
      all
    end
  end

  def self.get_all params
    if params[:store_id].present?
      products = Product.where(store_id: params[:store_id])
    else
      products = Product.all
    end
  end

  def self.my_products current_user, params
    limit_number = params[:limit].present? ? params[:limit] : DEFAULT_LIMIT
    my_categories = current_user.store_categories.all.map(&:id)
    stores = Store.joins("INNER JOIN store_store_categories ON stores.id = store_store_categories.store_id ").where("store_store_categories.store_category_id IN (?)", my_categories).all.map(&:id).uniq
    Product.where(store_id: stores).order('random()').limit(limit_number)
  end

  def self.get_user_favourites params
    products = Product.where(promotion_id: params[:promotion_id])
  end


end
