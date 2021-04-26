# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_26_023436) do

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_countries_on_user_id"
  end

  create_table "hotels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "day", null: false
    t.date "go_date", null: false
    t.date "back_date", null: false
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "howmany"
    t.index ["country_id"], name: "index_hotels_on_country_id"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "passport_number", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "nationality", null: false
    t.date "birthday", null: false
    t.string "gender", null: false
    t.string "registered_place", null: false
    t.date "issue_date", null: false
    t.date "expiry_date", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_infos_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.bigint "plane_id"
    t.bigint "hotel_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_orders_on_country_id"
    t.index ["hotel_id"], name: "index_orders_on_hotel_id"
    t.index ["plane_id"], name: "index_orders_on_plane_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "plane_gos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "howmany", null: false
    t.date "go_date", null: false
    t.string "go_time", null: false
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_plane_gos_on_country_id"
    t.index ["user_id"], name: "index_plane_gos_on_user_id"
  end

  create_table "planes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.date "go_date", null: false
    t.date "back_date", null: false
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "go_time"
    t.string "back_time"
    t.integer "howmany"
    t.index ["country_id"], name: "index_planes_on_country_id"
    t.index ["user_id"], name: "index_planes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.date "birthday", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "countries", "users"
  add_foreign_key "hotels", "countries"
  add_foreign_key "hotels", "users"
  add_foreign_key "infos", "orders"
  add_foreign_key "orders", "countries"
  add_foreign_key "orders", "users"
  add_foreign_key "plane_gos", "countries"
  add_foreign_key "plane_gos", "users"
  add_foreign_key "planes", "countries"
  add_foreign_key "planes", "users"
end
