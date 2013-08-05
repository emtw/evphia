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

ActiveRecord::Schema.define(version: 20130805200807) do

  create_table "funerals", force: true do |t|
    t.string   "funeral_pref"
    t.text     "casket_pref"
    t.string   "other_pref"
    t.string   "service_location"
    t.string   "burial_location"
    t.string   "ashes_location"
    t.text     "songs_pref"
    t.text     "readings"
    t.text     "speakers"
    t.text     "final_words"
    t.string   "dress_code"
    t.string   "flowers"
    t.string   "donations_to"
    t.text     "wake"
    t.text     "epitaph"
    t.text     "additional_reqs"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "username"
    t.boolean  "guest",                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "guests", ["reset_password_token"], name: "index_guests_on_reset_password_token", unique: true
  add_index "guests", ["username"], name: "index_guests_on_username", unique: true

  create_table "keyholders", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.string   "house"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "keyholder",              default: true
  end

  add_index "keyholders", ["reset_password_token"], name: "index_keyholders_on_reset_password_token", unique: true
  add_index "keyholders", ["username"], name: "index_keyholders_on_username", unique: true

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "middle_names"
    t.string   "last_name"
    t.date     "date_of_birth",          limit: 255
    t.string   "gender"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "line_3"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.string   "contact_number"
    t.string   "username"
    t.integer  "keyholder_id"
    t.integer  "guest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                              default: "",   null: false
    t.string   "encrypted_password",                 default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "user",                               default: true
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
