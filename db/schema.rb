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

ActiveRecord::Schema.define(version: 20171112073732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adapter_plugs", force: :cascade do |t|
    t.bigint "adapter_id"
    t.bigint "charge_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adapter_id"], name: "index_adapter_plugs_on_adapter_id"
    t.index ["charge_station_id"], name: "index_adapter_plugs_on_charge_station_id"
  end

  create_table "adapters", force: :cascade do |t|
    t.string "to_plug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "number"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_time"
    t.string "name"
    t.integer "price_cents"
    t.bigint "vehicle_id"
    t.bigint "charge_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_station_id"], name: "index_bookings_on_charge_station_id"
    t.index ["vehicle_id"], name: "index_bookings_on_vehicle_id"
  end

  create_table "charge_sessions", force: :cascade do |t|
    t.bigint "action_id"
    t.time "time"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_charge_sessions_on_action_id"
    t.index ["booking_id"], name: "index_charge_sessions_on_booking_id"
  end

  create_table "charge_stations", force: :cascade do |t|
    t.float "charge_kwh"
    t.bigint "adapter_id"
    t.time "open_time"
    t.time "close_time"
    t.string "days_of_week"
    t.integer "price_kwh_cents"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.index ["adapter_id"], name: "index_charge_stations_on_adapter_id"
    t.index ["address_id"], name: "index_charge_stations_on_address_id"
    t.index ["user_id"], name: "index_charge_stations_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "charge_station_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_station_id"], name: "index_conversations_on_charge_station_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "charge_station_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_station_id"], name: "index_favourites_on_charge_station_id"
    t.index ["vehicle_id"], name: "index_favourites_on_vehicle_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.boolean "read"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "price_cents"
    t.string "charge_identifier"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "image_data"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_profiles_on_address_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "licence_plate"
    t.string "make"
    t.string "model"
    t.string "colour"
    t.float "charger_kwh"
    t.string "drivers_licence_number"
    t.text "image_data"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "adapter_plugs", "adapters"
  add_foreign_key "adapter_plugs", "charge_stations"
  add_foreign_key "bookings", "charge_stations"
  add_foreign_key "bookings", "vehicles"
  add_foreign_key "charge_sessions", "actions"
  add_foreign_key "charge_sessions", "bookings"
  add_foreign_key "charge_stations", "adapters"
  add_foreign_key "charge_stations", "addresses"
  add_foreign_key "charge_stations", "users"
  add_foreign_key "conversations", "charge_stations"
  add_foreign_key "conversations", "users"
  add_foreign_key "favourites", "charge_stations"
  add_foreign_key "favourites", "vehicles"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "payments", "bookings"
  add_foreign_key "profiles", "addresses"
  add_foreign_key "profiles", "users"
  add_foreign_key "vehicles", "users"
end
