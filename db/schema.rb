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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130409122053) do

  create_table "capabilities", :force => true do |t|
    t.string   "cap_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "capabilities_places", :force => true do |t|
    t.integer  "capability_id"
    t.integer  "place_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.boolean  "person_type"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "people", ["username", "password"], :name => "usrnm_pswrd_index"

  create_table "places", :force => true do |t|
    t.string   "placename"
    t.string   "building"
    t.integer  "size"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "places", ["placename", "building"], :name => "build_pname_index"
  add_index "places", ["size"], :name => "size_index"

  create_table "reservations", :force => true do |t|
    t.integer  "place_id"
    t.date     "from"
    t.date     "to"
    t.integer  "period"
    t.text     "purpose"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
