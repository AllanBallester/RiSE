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

ActiveRecord::Schema.define(version: 20170811192027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homelesses", force: :cascade do |t|
    t.string   "name"
    t.text     "story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "last_name"
    t.string   "phone"
    t.string   "fb_account"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "homeless_id"
    t.integer  "riser_id"
    t.string   "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["homeless_id"], name: "index_photos_on_homeless_id", using: :btree
    t.index ["riser_id"], name: "index_photos_on_riser_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "homeless_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "riser_id"
    t.index ["homeless_id"], name: "index_reviews_on_homeless_id", using: :btree
    t.index ["riser_id"], name: "index_reviews_on_riser_id", using: :btree
  end

  create_table "risers", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "photos", "homelesses"
  add_foreign_key "photos", "risers"
  add_foreign_key "reviews", "homelesses"
  add_foreign_key "reviews", "risers"
end
