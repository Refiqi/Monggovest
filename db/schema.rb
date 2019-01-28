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

ActiveRecord::Schema.define(version: 2019_01_16_135521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "investor_details", force: :cascade do |t|
    t.bigint "user_investor_id"
    t.string "id_card_number"
    t.string "addres"
    t.string "phone_number"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "income_resource"
    t.integer "id_card_type"
    t.integer "salary_range"
    t.index ["user_investor_id"], name: "index_investor_details_on_user_investor_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.bigint "user_investor_id"
    t.integer "payment_method"
    t.string "card_number"
    t.date "card_valid_date"
    t.string "cvv"
    t.boolean "isPaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_holder_name"
    t.integer "receipt"
    t.index ["user_investor_id"], name: "index_payment_details_on_user_investor_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "product_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_pictures_on_product_id"
  end

  create_table "product_invest_details", force: :cascade do |t|
    t.bigint "product_invest_id"
    t.text "description"
    t.integer "period"
    t.float "return_value"
    t.integer "share_periode"
    t.text "background"
    t.integer "count_view", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_invest_id"], name: "index_product_invest_details_on_product_invest_id"
  end

  create_table "product_invests", force: :cascade do |t|
    t.bigint "product_id"
    t.float "price"
    t.integer "slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_invests_on_product_id"
  end

  create_table "products", force: :cascade do |t|
<<<<<<< HEAD
    t.bigint "regional_id"
    t.bigint "province_id"
    t.bigint "subdistricts_id"
=======
    t.bigint "subdistrict_id"
>>>>>>> bbf41c1f8cc7fc1907009c7eadf5d94bdbb2bfe3
    t.integer "product_type", default: 0
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.index ["province_id"], name: "index_products_on_province_id"
    t.index ["regional_id"], name: "index_products_on_regional_id"
    t.index ["subdistricts_id"], name: "index_products_on_subdistricts_id"
=======
    t.index ["subdistrict_id"], name: "index_products_on_subdistrict_id"
>>>>>>> bbf41c1f8cc7fc1907009c7eadf5d94bdbb2bfe3
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regionals", force: :cascade do |t|
    t.bigint "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_regionals_on_province_id"
  end

  create_table "sliders", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "url"
    t.integer "sort_number"
    t.boolean "isActive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subdistricts", force: :cascade do |t|
    t.bigint "regional_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regional_id"], name: "index_subdistricts_on_regional_id"
  end

  create_table "user_investors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_invests_id"
    t.integer "investor_slot"
    t.float "investor_pay"
    t.integer "invest_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_invests_id"], name: "index_user_investors_on_product_invests_id"
    t.index ["user_id"], name: "index_user_investors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "role", default: "user", null: false
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "investor_details", "user_investors"
  add_foreign_key "payment_details", "user_investors"
  add_foreign_key "pictures", "products"
  add_foreign_key "product_invest_details", "product_invests"
  add_foreign_key "product_invests", "products"
<<<<<<< HEAD
  add_foreign_key "products", "provinces"
  add_foreign_key "products", "regionals"
  add_foreign_key "products", "subdistricts", column: "subdistricts_id"
=======
  add_foreign_key "products", "subdistricts"
>>>>>>> bbf41c1f8cc7fc1907009c7eadf5d94bdbb2bfe3
  add_foreign_key "regionals", "provinces"
  add_foreign_key "subdistricts", "regionals"
  add_foreign_key "user_investors", "product_invests", column: "product_invests_id"
  add_foreign_key "user_investors", "users"
end
