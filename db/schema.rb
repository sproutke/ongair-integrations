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

ActiveRecord::Schema.define(version: 20151119125200) do

  create_table "accounts", force: :cascade do |t|
    t.string   "zendesk_url"
    t.string   "zendesk_access_token"
    t.string   "zendesk_user"
    t.string   "ongair_token"
    t.string   "ongair_phone_number"
    t.string   "ongair_url"
    t.string   "zendesk_ticket_auto_responder"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "setup",                         default: false
    t.string   "ticket_end_status",             default: "4"
    t.string   "ticket_closed_notification"
    t.boolean  "detect_language",               default: false
    t.string   "auth_method",                   default: "token_access"
    t.string   "name"
    t.string   "timezone"
    t.string   "integration_type",              default: "Zendesk"
    t.string   "freshdesk_url"
    t.string   "freshdesk_token"
  end

  create_table "business_hours", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "day"
    t.string   "from"
    t.string   "to"
    t.boolean  "work_day",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_hours", ["account_id"], name: "index_business_hours_on_account_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["account_id"], name: "index_locations_on_account_id"

  create_table "responses", force: :cascade do |t|
    t.integer  "account_id"
    t.text     "in_business_hours"
    t.text     "not_in_business_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["account_id"], name: "index_responses_on_account_id"

  create_table "surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.integer  "account_id"
    t.integer  "rating"
    t.string   "comment"
    t.boolean  "completed",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["account_id"], name: "index_surveys_on_account_id"
  add_index "surveys", ["ticket_id"], name: "index_surveys_on_ticket_id"
  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "ticket_id"
    t.string   "status"
    t.string   "source"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tickets", ["account_id"], name: "index_tickets_on_account_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "messaging_service"
    t.string   "phone_number"
    t.string   "zendesk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id"

end
