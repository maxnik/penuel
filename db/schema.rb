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

ActiveRecord::Schema.define(version: 20140617234834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coaches_teams", force: true do |t|
    t.integer  "coach_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", force: true do |t|
    t.text     "description_ru"
    t.text     "description_en"
    t.decimal  "amount"
    t.integer  "user_id"
    t.integer  "kind",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment_teams", force: true do |t|
    t.integer  "equipment_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: true do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.string   "championship_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues_teams", force: true do |t|
    t.integer  "league_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.string   "championship_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name_ru"
    t.string   "name_en"
    t.string   "locale",          default: "ru"
    t.integer  "role",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

end
