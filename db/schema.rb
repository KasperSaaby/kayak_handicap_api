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

ActiveRecord::Schema.define(version: 20150421201939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boat_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.string   "uri"
    t.float    "lat"
    t.float    "lng"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members_participations", id: false, force: :cascade do |t|
    t.integer "participation_id"
    t.integer "member_id"
  end

  add_index "members_participations", ["member_id"], name: "index_members_participations_on_member_id", using: :btree
  add_index "members_participations", ["participation_id"], name: "index_members_participations_on_participation_id", using: :btree

  create_table "participations", force: :cascade do |t|
    t.time     "start"
    t.time     "end"
    t.integer  "race_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "boat_type_id"
  end

  add_index "participations", ["boat_type_id"], name: "index_participations_on_boat_type_id", using: :btree

  create_table "races", force: :cascade do |t|
    t.datetime "date"
    t.float    "air_temperature"
    t.float    "wind_speed"
    t.string   "wind_direction"
    t.integer  "season_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "year"
    t.string   "point_system"
    t.integer  "club_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "time_keepings", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
