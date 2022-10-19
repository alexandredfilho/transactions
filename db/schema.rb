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

ActiveRecord::Schema[7.0].define(version: 2022_10_18_015621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cnab_transactions", force: :cascade do |t|
    t.integer "type_transaction", default: 1
    t.date "date_transaction"
    t.float "value"
    t.float "decimal"
    t.string "cpf"
    t.string "card_number"
    t.time "hour_transaction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id", null: false
    t.index ["store_id"], name: "index_cnab_transactions_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "store_admin"
    t.decimal "balance", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cnab_transactions", "stores"
end
