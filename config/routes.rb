Rails.application.routes.draw do
  devise_for :users
  namespace :api, default: {format: :json} do
    namespace :v1 do 
      resources :users, only: [:create] do
        put :profile, on: :collection
        get :me, on: :collection
        get :product_promotions, on: :collection
        post :create_admin, on: :collection
        get :get_admins, on: :collection
        get :get_park_state, on: :collection
      end
      resources :sessions, only: :create do
        post :smart_tv, on: :collection
        post :fb, on: :collection
        post :gmail, on: :collection
        post :logout, on: :collection
      end
      resources :store_categories do
        get :search, on: :collection
        get :preferences, on: :collection
        post :like, on: :collection
        post :dislike, on: :collection
      end
      resources :stores do
        get :search, on: :collection
        get :favorites, on: :collection
        post :like, on: :collection
        post :dislike, on: :collection
      end
      resources :incidents, only: [:create, :index] do
        get :me, on: :collection
        get :search, on: :collection
        get :all, on: :collection
      end
      resources :parking_lots , only: [:create, :index, :show] do 
        put :set_logo, on: :member
      end
      resources :parking_levels , only: [:create, :index, :update] do
        get :search
        put :set_image_level, on: :member
      end
      resources :user_places do
        get :search
      end
      resources :road_dots do
        get :search
        get :generate_route, on: :collection
      end
      resources :roads , only: [:create, :update] do
        get :search, on: :collection
      end
      resources :map_labels , only: [:create, :update] do
        get :search, on: :collection
      end
      resources :park_zones, only: [:create, :index] do
        get :search
        put :set_image_level, on: :member
      end
      resources :park_zone_dots, only: [:index] do
        get :search_by_level
      end
      resources :parking_places, only: [:create] do
      end
      resources :parking_sensors, only: [:create] do
      end
      resources :sensor_maintenances, only: [:create] do
      end
      resources :brands
      resources :price_units, only: [:index]
      resources :products do
        get :search, on: :collection
        get :favorites, on: :collection
        post :like, on: :collection
        post :dislike, on: :collection
        get :my_products, on: :collection
        post :reviewed_products, on: :collection
      end
      resources :product_categories
      resources :promotions do
        get :all_promotions, on: :collection
      end
      resources :events do
        get   :banners, on: :collection
      end
      resources :smart_tv_sponsors
      resources :background_color
      resources :smart_tv_users do
        post :login, on: :collection
        get :show_sponsor_tv_event, on: :member
        post :sponsor_tv_event, on: :member
        get :get_tokens, on: :collection
      end
      resources :roulettes do
        post :play, on: :collection
        get :check, on: :collection
        get :promotions, on: :collection
        post :send_smart_tv_prize, on: :collection
      end
      resources :images do 
        get :url, on: :collection
      end
      resources :sensors, only: [:index] do 
      end
      resources :points_menus, only: [:index]
      resources :roles, only: [:index]
    end
  end
end
