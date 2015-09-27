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

ActiveRecord::Schema.define(version: 20150927122910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interactions", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.date     "date"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interactions", ["product_id"], name: "index_interactions_on_product_id", using: :btree
  add_index "interactions", ["store_id"], name: "index_interactions_on_store_id", using: :btree

  create_table "inventories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.integer  "quantity"
    t.integer  "sales"
    t.integer  "shipment"
    t.date     "lcbo_updated_on"
    t.datetime "lcbo_updated_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "inventories", ["product_id"], name: "index_inventories_on_product_id", using: :btree
  add_index "inventories", ["store_id"], name: "index_inventories_on_store_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.integer  "case_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "phone"
    t.string   "fax"
    t.boolean  "dead"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "store_class_id"
    t.datetime "lcbo_updated_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "manager_name"
    t.string   "manager_email"
  end

  add_index "stores", ["store_class_id"], name: "index_stores_on_store_class_id", using: :btree

  add_foreign_key "interactions", "products"
  add_foreign_key "interactions", "stores"
end
