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

ActiveRecord::Schema[8.0].define(version: 2025_01_09_230406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "order_promotions", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "promotion_id"
    t.decimal "discount_applied", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_promotions_on_order_id"
    t.index ["promotion_id"], name: "index_order_promotions_on_promotion_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number", null: false
    t.decimal "total", precision: 10, scale: 2
    t.decimal "total_after_discounts", precision: 10, scale: 2
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_orders_on_created_at"
    t.index ["updated_at"], name: "index_orders_on_updated_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "promotion_actions", force: :cascade do |t|
    t.bigint "promotion_id", null: false
    t.string "type", null: false
    t.jsonb "preferences", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotion_actions_on_promotion_id"
  end

  create_table "promotion_rules", force: :cascade do |t|
    t.bigint "promotion_id", null: false
    t.string "type", null: false
    t.jsonb "preferences", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotion_rules_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.boolean "advertised", default: true
    t.boolean "active", default: true
    t.datetime "starts_at"
    t.datetime "expires_at"
    t.integer "usage_limits"
    t.text "description"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_promotions_on_code", unique: true
    t.index ["created_at"], name: "index_promotions_on_created_at"
    t.index ["expires_at"], name: "index_promotions_on_expires_at"
    t.index ["starts_at"], name: "index_promotions_on_starts_at"
    t.index ["updated_at"], name: "index_promotions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location", default: "USA"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_promotions", "orders"
  add_foreign_key "order_promotions", "promotions"
  add_foreign_key "orders", "users"
  add_foreign_key "promotion_actions", "promotions"
  add_foreign_key "promotion_rules", "promotions"
end
