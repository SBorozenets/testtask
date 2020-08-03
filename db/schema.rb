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

ActiveRecord::Schema.define(version: 2020_08_03_030615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_sales", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "revenue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_sales_on_client_id", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "create_total_revenues", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "total_revenue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_create_total_revenues_on_client_id", unique: true
  end

  create_table "summaries", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "max_revenue"
    t.bigint "min_revenue"
    t.bigint "current_min_revenue"
    t.bigint "sum_revenue"
    t.bigint "revenue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
