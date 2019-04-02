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

ActiveRecord::Schema.define(version: 20170123150329) do

  create_table "frids", id: false, force: :cascade do |t|
    t.integer  "userid"
    t.integer  "friendid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userid", "friendid"], name: "index_frids_on_userid_and_friendid", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string   "filename"
    t.binary   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "isseys", force: :cascade do |t|
    t.string   "userid"
    t.string   "pass"
    t.string   "name"
    t.string   "grade"
    t.integer  "age"
    t.string   "profile"
    t.integer  "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "userid"
    t.integer  "user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "stampimages", force: :cascade do |t|
    t.string   "name"
    t.integer  "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "stamps", force: :cascade do |t|
    t.string   "stampname"
    t.binary   "stamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userimages", force: :cascade do |t|
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "userpoints", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "point",      default: 300
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id", "created_at"], name: "index_userpoints_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_userpoints_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image",              default: ""
    t.string   "encrypted_password", default: "",    null: false
    t.boolean  "admin_flg",          default: false
    t.integer  "sex",                default: 0
    t.integer  "point",              default: 300
    t.integer  "favorite_type",      default: 0
  end

  create_table "userstamps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stamp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
