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

ActiveRecord::Schema.define(version: 2021_02_22_155921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bid_ask_currencies", force: :cascade do |t|
    t.bigint "currency_id"
    t.decimal "bid"
    t.decimal "ask"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_bid_ask_currencies_on_currency_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "value"
  end

  create_table "currency_histories", force: :cascade do |t|
    t.bigint "currency_id"
    t.decimal "mid"
    t.date "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_currency_histories_on_currency_id"
  end

  create_table "sent_emails", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "currency_id"
    t.string "operation_type"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_sent_emails_on_currency_id"
    t.index ["user_id"], name: "index_sent_emails_on_user_id"
  end

  create_table "user_currencies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "purchase"
    t.decimal "sale"
    t.index ["currency_id"], name: "index_user_currencies_on_currency_id"
    t.index ["user_id"], name: "index_user_currencies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nick"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nick"], name: "index_users_on_nick", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bid_ask_currencies", "currencies"
  add_foreign_key "sent_emails", "currencies"
  add_foreign_key "sent_emails", "users"
  add_foreign_key "user_currencies", "currencies"
  add_foreign_key "user_currencies", "users"
end
