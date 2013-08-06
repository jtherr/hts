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

ActiveRecord::Schema.define(version: 20130806022529) do

  create_table "categories", force: true do |t|
    t.string  "name",     null: false
    t.integer "position"
  end

  create_table "news_items", force: true do |t|
    t.datetime "date",        null: false
    t.string   "description", null: false
  end

  create_table "products", force: true do |t|
    t.integer "category_id", null: false
    t.string  "company",     null: false
    t.string  "name",        null: false
    t.boolean "premier",     null: false
    t.integer "position"
  end

  create_table "quote_requests", force: true do |t|
    t.string   "name",       null: false
    t.string   "company",    null: false
    t.string   "phone",      null: false
    t.string   "fax"
    t.string   "email"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "additional"
    t.datetime "date",       null: false
  end

  create_table "users", force: true do |t|
    t.string "email",           null: false
    t.string "password_digest", null: false
  end

end
