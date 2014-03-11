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

ActiveRecord::Schema.define(version: 20140311000232) do

  create_table "beacons", force: true do |t|
    t.string   "uuid"
    t.integer  "major"
    t.integer  "minor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beacons", ["major"], name: "index_beacons_on_major", using: :btree
  add_index "beacons", ["minor"], name: "index_beacons_on_minor", using: :btree
  add_index "beacons", ["uuid", "major", "minor"], name: "index_beacons_on_uuid_and_major_and_minor", unique: true, using: :btree
  add_index "beacons", ["uuid"], name: "index_beacons_on_uuid", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "items", force: true do |t|
    t.string   "spec"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
