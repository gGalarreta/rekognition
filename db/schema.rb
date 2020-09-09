# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 201807152256304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "background_colors", force: :cascade do |t|
    t.string "hexadecimal_color"
    t.string "description"
    t.bigint "smart_tv_sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["smart_tv_sponsor_id"], name: "index_background_colors_on_smart_tv_sponsor_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "corporation_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.boolean "all_day"
    t.datetime "initial_time"
    t.datetime "final_time"
    t.date "event_date"
    t.string "banner_file_name"
    t.string "banner_content_type"
    t.integer "banner_file_size"
    t.datetime "banner_updated_at"
  end

  create_table "favorite_products", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorite_products_on_product_id"
    t.index ["user_id"], name: "index_favorite_products_on_user_id"
  end

  create_table "favorite_stores", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_favorite_stores_on_store_id"
    t.index ["user_id"], name: "index_favorite_stores_on_user_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.string "type"
    t.text "information"
    t.text "state"
    t.point "location"
    t.bigint "map_id"
    t.bigint "mall_level_id"
    t.bigint "mall_element_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mall_element_id"], name: "index_incidents_on_mall_element_id"
    t.index ["mall_level_id"], name: "index_incidents_on_mall_level_id"
    t.index ["map_id"], name: "index_incidents_on_map_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "description"
    t.float "max_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mall_beacons", force: :cascade do |t|
    t.bigint "map_id"
    t.bigint "mall_level_id"
    t.text "description"
    t.string "uuid"
    t.string "major"
    t.string "minor"
    t.integer "rssi_per_meter"
    t.integer "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.point "location"
    t.index ["mall_level_id"], name: "index_mall_beacons_on_mall_level_id"
    t.index ["map_id"], name: "index_mall_beacons_on_map_id"
  end

  create_table "mall_elements", force: :cascade do |t|
    t.bigint "mall_level_id"
    t.bigint "store_id"
    t.bigint "map_id"
    t.string "type"
    t.point "access_points", default: [], array: true
    t.point "limit_points", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["mall_level_id"], name: "index_mall_elements_on_mall_level_id"
    t.index ["map_id"], name: "index_mall_elements_on_map_id"
    t.index ["store_id"], name: "index_mall_elements_on_store_id"
  end

  create_table "mall_elevation_paths", force: :cascade do |t|
    t.integer "mall_elevation_id_first"
    t.integer "mall_elevation_id_second"
    t.bigint "map_id"
    t.string "direction"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_mall_elevation_paths_on_map_id"
  end

  create_table "mall_elevations", force: :cascade do |t|
    t.bigint "map_id"
    t.bigint "mall_level_id"
    t.bigint "mall_node_id"
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mall_level_id"], name: "index_mall_elevations_on_mall_level_id"
    t.index ["mall_node_id"], name: "index_mall_elevations_on_mall_node_id"
    t.index ["map_id"], name: "index_mall_elevations_on_map_id"
  end

  create_table "mall_levels", force: :cascade do |t|
    t.bigint "map_id"
    t.string "title"
    t.text "image"
    t.float "angle"
    t.float "opacity"
    t.integer "level"
    t.point "projection_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "image_width"
    t.integer "image_height"
    t.point "location", default: [], array: true
    t.index ["map_id"], name: "index_mall_levels_on_map_id"
  end

  create_table "mall_node_paths", force: :cascade do |t|
    t.integer "mall_node_id_first"
    t.integer "mall_node_id_second"
    t.bigint "map_id"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_mall_node_paths_on_map_id"
  end

  create_table "mall_nodes", force: :cascade do |t|
    t.bigint "map_id"
    t.bigint "mall_level_id"
    t.point "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mall_level_id"], name: "index_mall_nodes_on_mall_level_id"
    t.index ["map_id"], name: "index_mall_nodes_on_map_id"
  end

  create_table "map_labels", force: :cascade do |t|
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.text "description"
    t.float "x_coord"
    t.float "y_coord"
    t.string "image"
    t.index ["parking_level_id"], name: "index_map_labels_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_map_labels_on_parking_lot_id"
  end

  create_table "maps", force: :cascade do |t|
    t.text "description"
    t.text "image"
    t.string "state"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "image_width"
    t.integer "image_height"
  end

  create_table "park_zone_dots", force: :cascade do |t|
    t.bigint "park_zone_id"
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.float "x_coord"
    t.float "y_coord"
    t.integer "order_zone_dot"
    t.index ["park_zone_id"], name: "index_park_zone_dots_on_park_zone_id"
    t.index ["parking_level_id"], name: "index_park_zone_dots_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_park_zone_dots_on_parking_lot_id"
  end

  create_table "park_zone_reservations", force: :cascade do |t|
    t.bigint "park_zone_id"
    t.bigint "user_id"
    t.date "start_time"
    t.date "end_time"
    t.integer "state"
    t.index ["park_zone_id"], name: "index_park_zone_reservations_on_park_zone_id"
    t.index ["user_id"], name: "index_park_zone_reservations_on_user_id"
  end

  create_table "park_zone_types", force: :cascade do |t|
    t.integer "reserved"
    t.string "name"
    t.string "description"
  end

  create_table "park_zones", force: :cascade do |t|
    t.text "description"
    t.float "x_coord"
    t.float "y_coord"
    t.float "height"
    t.float "width"
    t.bigint "parking_level_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "url_image"
    t.bigint "parking_lot_id"
    t.float "image_width"
    t.float "image_height"
    t.string "color"
    t.bigint "park_zone_type_id"
    t.index ["park_zone_type_id"], name: "index_park_zones_on_park_zone_type_id"
    t.index ["parking_level_id"], name: "index_park_zones_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_park_zones_on_parking_lot_id"
  end

  create_table "park_zones_road_dots", force: :cascade do |t|
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.bigint "park_zone_id"
    t.bigint "road_dot_id"
    t.index ["park_zone_id"], name: "index_park_zones_road_dots_on_park_zone_id"
    t.index ["parking_level_id"], name: "index_park_zones_road_dots_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_park_zones_road_dots_on_parking_lot_id"
    t.index ["road_dot_id"], name: "index_park_zones_road_dots_on_road_dot_id"
  end

  create_table "parking_levels", force: :cascade do |t|
    t.bigint "parking_lot_id"
    t.integer "level_order"
    t.string "name"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "url_image"
    t.float "image_width"
    t.float "image_height"
    t.index ["parking_lot_id"], name: "index_parking_levels_on_parking_lot_id"
  end

  create_table "parking_lots", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.integer "n_levels"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "url_image"
  end

  create_table "parking_place_updates_sessions", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "user_id"
    t.bigint "parking_place_id"
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.integer "new_state"
    t.index ["parking_level_id"], name: "index_parking_place_updates_sessions_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_parking_place_updates_sessions_on_parking_lot_id"
    t.index ["parking_place_id"], name: "index_parking_place_updates_sessions_on_parking_place_id"
    t.index ["session_id"], name: "index_parking_place_updates_sessions_on_session_id"
    t.index ["user_id"], name: "index_parking_place_updates_sessions_on_user_id"
  end

  create_table "parking_places", force: :cascade do |t|
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.float "x_coord"
    t.float "y_coord"
    t.integer "state"
    t.integer "sensor_id"
    t.float "angle"
    t.bigint "park_zone_id"
    t.float "width"
    t.float "height"
    t.index ["park_zone_id"], name: "index_parking_places_on_park_zone_id"
    t.index ["parking_level_id"], name: "index_parking_places_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_parking_places_on_parking_lot_id"
  end

  create_table "parking_places_road_dots", force: :cascade do |t|
    t.bigint "parking_place_id"
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.bigint "road_dot_from_id"
    t.bigint "road_dot_to_id"
    t.bigint "road_dot_connection_id"
    t.index ["parking_level_id"], name: "index_parking_places_road_dots_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_parking_places_road_dots_on_parking_lot_id"
    t.index ["parking_place_id"], name: "index_parking_places_road_dots_on_parking_place_id"
    t.index ["road_dot_connection_id"], name: "index_parking_places_road_dots_on_road_dot_connection_id"
    t.index ["road_dot_from_id"], name: "index_parking_places_road_dots_on_road_dot_from_id"
    t.index ["road_dot_to_id"], name: "index_parking_places_road_dots_on_road_dot_to_id"
  end

  create_table "points_menus", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spanish_name"
  end

  create_table "preference_store_categories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_category_id"], name: "index_preference_store_categories_on_store_category_id"
    t.index ["user_id"], name: "index_preference_store_categories_on_user_id"
  end

  create_table "price_units", force: :cascade do |t|
    t.string "value"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_id"
    t.bigint "product_category_id"
    t.bigint "store_id"
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "price"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["promotion_id"], name: "index_products_on_promotion_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.date "initial_date"
    t.date "final_date"
    t.string "value"
    t.boolean "only_mobile"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "level_id"
    t.index ["level_id"], name: "index_promotions_on_level_id"
    t.index ["store_id"], name: "index_promotions_on_store_id"
  end

  create_table "reviewed_products", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_category_id"], name: "index_reviewed_products_on_store_category_id"
    t.index ["user_id"], name: "index_reviewed_products_on_user_id"
  end

  create_table "road_dot_connections", force: :cascade do |t|
    t.bigint "road_dot_from_id"
    t.bigint "road_dot_to_id"
    t.integer "type_dot_connection"
    t.index ["road_dot_from_id"], name: "index_road_dot_connections_on_road_dot_from_id"
    t.index ["road_dot_to_id"], name: "index_road_dot_connections_on_road_dot_to_id"
  end

  create_table "road_dots", force: :cascade do |t|
    t.float "x_coord"
    t.float "y_coord"
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.string "name"
    t.integer "type_dot"
    t.index ["parking_level_id"], name: "index_road_dots_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_road_dots_on_parking_lot_id"
  end

  create_table "roads", force: :cascade do |t|
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.integer "x_start"
    t.integer "y_start"
    t.integer "x_end"
    t.integer "y_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_level_id"], name: "index_roads_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_roads_on_parking_lot_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roulettes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "smart_tv_sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["smart_tv_sponsor_id"], name: "index_roulettes_on_smart_tv_sponsor_id"
    t.index ["user_id"], name: "index_roulettes_on_user_id"
  end

  create_table "sensor_logs", force: :cascade do |t|
    t.integer "sensor_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensor_maintenances", force: :cascade do |t|
    t.bigint "parking_place_id"
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.date "maintenance_date"
    t.text "description"
    t.integer "recording_user"
    t.index ["parking_level_id"], name: "index_sensor_maintenances_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_sensor_maintenances_on_parking_lot_id"
    t.index ["parking_place_id"], name: "index_sensor_maintenances_on_parking_place_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "access_token", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "smart_tv_sponsors", force: :cascade do |t|
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "image_frame"
  end

  create_table "smart_tv_users", force: :cascade do |t|
    t.string "password_tv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_tv"
  end

  create_table "sponsor_stores", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "smart_tv_sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["smart_tv_sponsor_id"], name: "index_sponsor_stores_on_smart_tv_sponsor_id"
    t.index ["store_id"], name: "index_sponsor_stores_on_store_id"
  end

  create_table "store_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon_file_name"
    t.string "icon_content_type"
    t.integer "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "store_events", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "event_id"
    t.string "banner_file_name"
    t.string "banner_content_type"
    t.integer "banner_file_size"
    t.datetime "banner_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_store_events_on_event_id"
    t.index ["store_id"], name: "index_store_events_on_store_id"
  end

  create_table "store_store_categories", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "store_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_category_id"], name: "index_store_store_categories_on_store_category_id"
    t.index ["store_id"], name: "index_store_store_categories_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "webpage"
    t.string "contact_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "banner_file_name"
    t.string "banner_content_type"
    t.integer "banner_file_size"
    t.datetime "banner_updated_at"
    t.integer "admin_id"
  end

  create_table "technical_specifications", force: :cascade do |t|
    t.string "description"
    t.string "weight"
    t.string "length"
    t.string "height"
    t.string "brand"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_technical_specifications_on_product_id"
  end

  create_table "user_places", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "parking_place_id"
    t.bigint "parking_level_id"
    t.bigint "parking_lot_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["parking_level_id"], name: "index_user_places_on_parking_level_id"
    t.index ["parking_lot_id"], name: "index_user_places_on_parking_lot_id"
    t.index ["parking_place_id"], name: "index_user_places_on_parking_place_id"
    t.index ["user_id"], name: "index_user_places_on_user_id"
  end

  create_table "user_points_menus", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "points_menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["points_menu_id"], name: "index_user_points_menus_on_points_menu_id"
    t.index ["user_id"], name: "index_user_points_menus_on_user_id"
  end

  create_table "user_sponsors", force: :cascade do |t|
    t.bigint "smart_tv_user_id"
    t.bigint "smart_tv_sponsor_id"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["smart_tv_sponsor_id"], name: "index_user_sponsors_on_smart_tv_sponsor_id"
    t.index ["smart_tv_user_id"], name: "index_user_sponsors_on_smart_tv_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "phone_number"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.bigint "level_id"
    t.integer "gamification_points_amount"
    t.integer "flag_park"
    t.boolean "login_with_fb", default: false
    t.boolean "login_with_gmail", default: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["level_id"], name: "index_users_on_level_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "incidents", "mall_elements"
  add_foreign_key "incidents", "mall_levels"
  add_foreign_key "incidents", "maps"
  add_foreign_key "incidents", "users"
  add_foreign_key "mall_beacons", "mall_levels"
  add_foreign_key "mall_beacons", "maps"
  add_foreign_key "mall_elements", "mall_levels"
  add_foreign_key "mall_elements", "maps"
  add_foreign_key "mall_elements", "stores"
  add_foreign_key "mall_elevation_paths", "maps"
  add_foreign_key "mall_elevations", "mall_levels"
  add_foreign_key "mall_elevations", "mall_nodes"
  add_foreign_key "mall_elevations", "maps"
  add_foreign_key "mall_levels", "maps"
  add_foreign_key "mall_node_paths", "maps"
  add_foreign_key "mall_nodes", "mall_levels"
  add_foreign_key "mall_nodes", "maps"
  add_foreign_key "map_labels", "parking_levels"
  add_foreign_key "map_labels", "parking_lots"
  add_foreign_key "park_zone_dots", "park_zones"
  add_foreign_key "park_zone_dots", "parking_levels"
  add_foreign_key "park_zone_dots", "parking_lots"
  add_foreign_key "park_zone_reservations", "park_zones"
  add_foreign_key "park_zone_reservations", "users"
  add_foreign_key "park_zones", "parking_levels"
  add_foreign_key "park_zones", "parking_lots"
  add_foreign_key "park_zones_road_dots", "park_zones"
  add_foreign_key "park_zones_road_dots", "parking_levels"
  add_foreign_key "park_zones_road_dots", "parking_lots"
  add_foreign_key "park_zones_road_dots", "road_dots"
  add_foreign_key "parking_levels", "parking_lots"
  add_foreign_key "parking_place_updates_sessions", "parking_levels"
  add_foreign_key "parking_place_updates_sessions", "parking_lots"
  add_foreign_key "parking_place_updates_sessions", "parking_places"
  add_foreign_key "parking_place_updates_sessions", "sessions"
  add_foreign_key "parking_place_updates_sessions", "users"
  add_foreign_key "parking_places", "park_zones"
  add_foreign_key "parking_places", "parking_levels"
  add_foreign_key "parking_places", "parking_lots"
  add_foreign_key "parking_places_road_dots", "parking_levels"
  add_foreign_key "parking_places_road_dots", "parking_lots"
  add_foreign_key "parking_places_road_dots", "parking_places"
  add_foreign_key "parking_places_road_dots", "road_dot_connections"
  add_foreign_key "parking_places_road_dots", "road_dots", column: "road_dot_from_id"
  add_foreign_key "parking_places_road_dots", "road_dots", column: "road_dot_to_id"
  add_foreign_key "road_dot_connections", "road_dots", column: "road_dot_from_id"
  add_foreign_key "road_dot_connections", "road_dots", column: "road_dot_to_id"
  add_foreign_key "road_dots", "parking_levels"
  add_foreign_key "road_dots", "parking_lots"
  add_foreign_key "sensor_maintenances", "parking_levels"
  add_foreign_key "sensor_maintenances", "parking_lots"
  add_foreign_key "sensor_maintenances", "parking_places"
  add_foreign_key "user_places", "parking_levels"
  add_foreign_key "user_places", "parking_lots"
  add_foreign_key "user_places", "parking_places"
  add_foreign_key "user_places", "users"
end
