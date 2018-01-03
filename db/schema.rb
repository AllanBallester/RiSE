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

ActiveRecord::Schema.define(version: 20171229125622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: :cascade do |t|
    t.string   "state"
    t.integer  "amount_cents", default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "homelesses", force: :cascade do |t|
    t.string   "name"
    t.text     "story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "last_name"
    t.string   "phone"
    t.string   "fb_account"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
    t.integer  "riser_id"
    t.string   "skills"
    t.index ["riser_id"], name: "index_homelesses_on_riser_id", using: :btree
  end

  create_table "intentions", force: :cascade do |t|
    t.integer  "riser_id"
    t.integer  "homeless_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["homeless_id"], name: "index_intentions_on_homeless_id", using: :btree
    t.index ["riser_id"], name: "index_intentions_on_riser_id", using: :btree
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

  create_table "position_histories", force: :cascade do |t|
    t.integer  "homeless_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["homeless_id"], name: "index_position_histories_on_homeless_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "homeless_id"
    t.text     "content"
    t.string   "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "riser_id"
    t.index ["homeless_id"], name: "index_reviews_on_homeless_id", using: :btree
    t.index ["riser_id"], name: "index_reviews_on_riser_id", using: :btree
  end

  create_table "risers", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_risers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_risers_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "homelesses", "risers"
  add_foreign_key "intentions", "homelesses"
  add_foreign_key "intentions", "risers"
  add_foreign_key "photos", "homelesses"
  add_foreign_key "photos", "risers"
  add_foreign_key "position_histories", "homelesses"
  add_foreign_key "reviews", "homelesses"
  add_foreign_key "reviews", "risers"
end
