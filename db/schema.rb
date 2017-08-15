# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170815004402) do

  create_table "accounts", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "balance",     default: 0.0
  end

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "customer_type"
    t.string   "cpf_cnpj"
    t.string   "nome_razao_social"
    t.string   "apelido_fantasia"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "description"
    t.string   "entry_type"
    t.float    "value",       default: 0.0
    t.date     "date"
    t.integer  "account_id"
    t.integer  "category_id"
    t.text     "obs"
    t.string   "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "entries", ["account_id"], name: "index_entries_on_account_id"
  add_index "entries", ["category_id"], name: "index_entries_on_category_id"

  create_table "providers", force: :cascade do |t|
    t.string   "provider_type"
    t.string   "cpf_cnpj"
    t.string   "nome_razao_social"
    t.string   "apelido_fantasia"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "transferences", force: :cascade do |t|
    t.date     "date"
    t.float    "amount"
    t.integer  "debit_account"
    t.integer  "credit_account"
    t.text     "obs"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
