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

ActiveRecord::Schema.define(version: 20151027223826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "candies", ["name"], name: "index_candies_on_name", unique: true, using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name",               null: false
    t.integer  "created_by_user_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "people", ["name", "created_by_user_id"], name: "index_people_on_name_and_created_by_user_id", unique: true, using: :btree

  create_table "preferences", force: :cascade do |t|
    t.string   "type"
    t.integer  "candy_id",   null: false
    t.integer  "person_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "preferences", ["candy_id"], name: "index_preferences_on_candy_id", using: :btree
  add_index "preferences", ["person_id"], name: "index_preferences_on_person_id", using: :btree
  add_index "preferences", ["type", "candy_id", "person_id"], name: "index_preferences_on_type_and_candy_id_and_person_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",           default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
