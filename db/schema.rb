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

ActiveRecord::Schema.define(version: 20140902052521) do

  create_table "cities", force: true do |t|
    t.string   "provice"
    t.string   "name"
    t.text     "desc"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",   default: 0
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          default: 0, null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.string   "addr"
    t.string   "tel"
    t.text     "desc"
    t.text     "traffic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  add_index "hotels", ["city_id"], name: "index_hotels_on_city_id"

  create_table "images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "image_height"
    t.integer  "image_width"
    t.integer  "position"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id"
  add_index "images", ["imageable_type"], name: "index_images_on_imageable_type"
  add_index "images", ["position"], name: "index_images_on_position"

  create_table "order_infos", force: true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.string   "order_type"
    t.string   "notify_user"
    t.string   "notify_tel"
  end

  add_index "order_infos", ["order_id", "order_type"], name: "index_order_infos_on_order_id_and_order_type"

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hotel_id"
  end

  create_table "tickets", force: true do |t|
    t.string   "style"
    t.string   "title"
    t.text     "desc"
    t.float    "price"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
  end

  create_table "tour_orders", force: true do |t|
    t.float    "total_price"
    t.integer  "number"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ticket_id"
  end

  add_index "tour_orders", ["ticket_id"], name: "index_tour_orders_on_ticket_id"
  add_index "tour_orders", ["user_id"], name: "index_tour_orders_on_user_id"

  create_table "tours", force: true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.string   "addr"
    t.float    "price"
    t.string   "work_range"
    t.text     "hint"
    t.text     "desc"
    t.text     "traffic"
    t.string   "seq"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "level"
  end

  add_index "tours", ["city_id"], name: "index_tours_on_city_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
