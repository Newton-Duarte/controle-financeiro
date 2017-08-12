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

ActiveRecord::Schema.define(version: 20170809224130) do

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

end
