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

ActiveRecord::Schema.define(version: 20170401033036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "categories", force: :cascade do |t|
    t.citext   "code",                                       null: false
    t.citext   "name",                                       null: false
    t.datetime "created_at", default: '2017-04-02 04:10:15', null: false
    t.datetime "updated_at", default: '2017-04-02 04:10:15', null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.citext   "code",                                          null: false
    t.citext   "name",                                          null: false
    t.integer  "category_id"
    t.decimal  "price"
    t.datetime "created_at",    default: '2017-04-02 04:10:15', null: false
    t.datetime "updated_at",    default: '2017-04-02 04:10:15', null: false
    t.integer  "categories_id"
    t.index ["categories_id"], name: "index_products_on_categories_id", using: :btree
    t.index ["name"], name: "index_products_on_name", unique: true, using: :btree
  end

  add_foreign_key "products", "categories", column: "categories_id", on_delete: :cascade
end
