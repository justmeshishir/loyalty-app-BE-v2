# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_12_17_073823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_customers", force: :cascade do |t|
    t.bigint "business_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_customers_on_business_id"
    t.index ["customer_id"], name: "index_business_customers_on_customer_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone", null: false
    t.string "industry"
    t.string "logo_url"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "jti", null: false
    t.index ["email"], name: "index_businesses_on_email", unique: true
    t.index ["jti"], name: "index_businesses_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "phone", null: false
    t.date "dob"
    t.string "address"
    t.integer "gender"
    t.boolean "active", default: false
    t.text "notes", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loyalty_loyalty_settings", force: :cascade do |t|
    t.string "offer_name", null: false
    t.integer "status", default: 0
    t.integer "valid_days"
    t.string "type", comment: "Loyalty Plan type Stamp, Discount or Point"
    t.jsonb "rules", null: false
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_loyalty_loyalty_settings_on_business_id"
  end

  create_table "loyalty_stamps", force: :cascade do |t|
    t.bigint "business_customer_id"
    t.bigint "loyalty_loyalty_setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "expired", default: false, null: false
    t.index ["business_customer_id"], name: "index_loyalty_stamps_on_business_customer_id"
    t.index ["loyalty_loyalty_setting_id"], name: "index_loyalty_stamps_on_loyalty_loyalty_setting_id"
  end

  add_foreign_key "business_customers", "businesses"
  add_foreign_key "business_customers", "customers"
  add_foreign_key "loyalty_loyalty_settings", "businesses"
  add_foreign_key "loyalty_stamps", "business_customers"
  add_foreign_key "loyalty_stamps", "loyalty_loyalty_settings"
end
