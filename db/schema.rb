# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150721062652) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "image",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "status",      limit: 1
    t.integer  "row_order",   limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "site_link",   limit: 255
    t.integer  "merchant_id", limit: 4
  end

  add_index "banners", ["merchant_id"], name: "index_banners_on_merchant_id", using: :btree

  create_table "coordinates", force: :cascade do |t|
    t.integer  "page_id",      limit: 4
    t.string   "product_name", limit: 255
    t.string   "coordinates",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "site_link",    limit: 255
    t.string   "barcode",      limit: 255
    t.string   "product_id",   limit: 255
  end

  add_index "coordinates", ["page_id"], name: "index_coordinates_on_page_id", using: :btree

  create_table "logos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "status",     limit: 1
  end

  create_table "magazines", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "image",       limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.text     "title",       limit: 65535
    t.text     "category",    limit: 65535
    t.text     "bar_code",    limit: 65535
    t.text     "month",       limit: 65535
    t.text     "year",        limit: 65535
    t.boolean  "status",      limit: 1
    t.integer  "row_order",   limit: 4
    t.integer  "merchant_id", limit: 4
  end

  add_index "magazines", ["merchant_id"], name: "index_magazines_on_merchant_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "magazine_id", limit: 4
    t.integer  "page_number", limit: 4
    t.string   "image",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "status",      limit: 1
  end

  add_index "pages", ["magazine_id"], name: "index_pages_on_magazine_id", using: :btree

  create_table "splashscreens", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "video",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "coordinates", "pages"
  add_foreign_key "pages", "magazines"
end
