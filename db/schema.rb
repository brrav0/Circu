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

ActiveRecord::Schema.define(version: 20150521135417) do

  create_table "accounts", force: :cascade do |t|
    t.string   "number"
    t.string   "currency"
    t.decimal  "balance"
    t.integer  "client_id"
    t.integer  "signatory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "accounts", ["client_id"], name: "index_accounts_on_client_id"
  add_index "accounts", ["signatory_id"], name: "index_accounts_on_signatory_id"

  create_table "bank_contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bank_contacts", ["bank_id"], name: "index_bank_contacts_on_bank_id"

  create_table "bankaccounts", force: :cascade do |t|
    t.string   "number"
    t.string   "currency"
    t.decimal  "balance"
    t.integer  "client_id"
    t.integer  "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "shared"
    t.datetime "signed"
    t.datetime "issued"
    t.datetime "answered"
    t.string   "comments"
  end

  add_index "bankaccounts", ["bank_id"], name: "index_bankaccounts_on_bank_id"
  add_index "bankaccounts", ["client_id"], name: "index_bankaccounts_on_client_id"

  create_table "bankcontacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bankcontacts", ["bank_id"], name: "index_bankcontacts_on_bank_id"

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.string   "number_and_street"
    t.string   "zip_code"
    t.string   "city"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "clientcontacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clientcontacts", ["client_id"], name: "index_clientcontacts_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "number_and_street"
    t.string   "zip_code"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "clients", ["user_id", "created_at"], name: "index_clients_on_user_id_and_created_at"
  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "signatories", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "signatories", ["bank_id", "created_at"], name: "index_signatories_on_bank_id_and_created_at"
  add_index "signatories", ["bank_id"], name: "index_signatories_on_bank_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "clientcontact",     default: false
    t.boolean  "bankcontact",       default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
