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

ActiveRecord::Schema.define(version: 2019_02_27_094044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.boolean "used"
    t.datetime "expiry_date"
    t.boolean "location_validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "bar_id"
    t.bigint "meet_up_time_id"
    t.bigint "coupon_id"
    t.bigint "first_user_id"
    t.bigint "last_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_matches_on_bar_id"
    t.index ["coupon_id"], name: "index_matches_on_coupon_id"
    t.index ["first_user_id"], name: "index_matches_on_first_user_id"
    t.index ["last_user_id"], name: "index_matches_on_last_user_id"
    t.index ["meet_up_time_id"], name: "index_matches_on_meet_up_time_id"
  end

  create_table "meet_up_times", force: :cascade do |t|
    t.datetime "meet_up_time"
    t.boolean "first_user_accepted"
    t.boolean "last_user_accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bar_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_photos_on_bar_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "swipes", force: :cascade do |t|
    t.boolean "like"
    t.bigint "swiper_id"
    t.bigint "swipee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swipee_id"], name: "index_swipes_on_swipee_id"
    t.index ["swiper_id"], name: "index_swipes_on_swiper_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.integer "age"
    t.text "bio"
    t.string "location"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "bars"
  add_foreign_key "matches", "coupons"
  add_foreign_key "matches", "meet_up_times"
  add_foreign_key "matches", "users", column: "first_user_id"
  add_foreign_key "matches", "users", column: "last_user_id"
  add_foreign_key "swipes", "users", column: "swipee_id"
  add_foreign_key "swipes", "users", column: "swiper_id"
end
