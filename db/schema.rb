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

ActiveRecord::Schema.define(version: 2022_05_01_002913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_shops", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_url"
    t.float "rating"
    t.jsonb "coordinates", default: "{}", null: false
    t.jsonb "transaction_types", default: "{}", null: false
    t.jsonb "location", default: "{}", null: false
    t.string "phone"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "search_phrase"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zipcode", limit: 15
    t.string "email", null: false
    t.string "favorite_beverage"
    t.string "password_digest"
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

end
