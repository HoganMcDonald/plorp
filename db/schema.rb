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

ActiveRecord::Schema.define(version: 2022_02_21_160219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "plaid_id"
    t.string "account_type"
    t.integer "account_sub_type"
    t.decimal "balance"
    t.decimal "limit"
    t.bigint "authorization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authorization_id"], name: "index_accounts_on_authorization_id"
  end

  create_table "authorizations", force: :cascade do |t|
    t.string "access_token"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "budget_id", null: false
    t.index ["budget_id"], name: "index_authorizations_on_budget_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "budgets_users", id: false, force: :cascade do |t|
    t.bigint "budget_id", null: false
    t.bigint "user_id", null: false
    t.index ["budget_id", "user_id"], name: "index_posts_users", unique: true
  end

  create_table "spending_plans", force: :cascade do |t|
    t.bigint "budget_id", null: false
    t.bigint "account_id", null: false
    t.decimal "limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_spending_plans_on_account_id"
    t.index ["budget_id"], name: "index_spending_plans_on_budget_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.decimal "amount"
    t.string "category"
    t.datetime "authorized_date", precision: 6
    t.datetime "date", precision: 6
    t.string "transaction_id"
    t.string "merchant"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "authorizations"
  add_foreign_key "authorizations", "budgets"
  add_foreign_key "spending_plans", "accounts"
  add_foreign_key "spending_plans", "budgets"
  add_foreign_key "transactions", "accounts"
end
