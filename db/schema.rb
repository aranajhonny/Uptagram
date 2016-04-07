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

ActiveRecord::Schema.define(version: 20160405002200) do

  create_table "categorias", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorias", ["category_id"], name: "index_categorias_on_category_id"
  add_index "categorias", ["photo_id"], name: "index_categorias_on_photo_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "categories", ["photo_id"], name: "index_categories_on_photo_id"

  create_table "comments", force: :cascade do |t|
    t.text     "thoughts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "photo_id"
    t.integer  "user_id"
  end

  add_index "comments", ["photo_id"], name: "index_comments_on_photo_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "has_categories", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "has_categories", ["category_id"], name: "index_has_categories_on_category_id"
  add_index "has_categories", ["photo_id"], name: "index_has_categories_on_photo_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.boolean  "like"
  end

  add_index "likes", ["photo_id"], name: "index_likes_on_photo_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "image"
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
