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

ActiveRecord::Schema.define(:version => 20120101042326) do

  create_table "events", :force => true do |t|
    t.integer  "timeline_id"
    t.integer  "group_id"
    t.datetime "time"
    t.string   "video",       :default => "edit here"
    t.text     "description", :default => "edit here"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["group_id"], :name => "index_events_on_group_id"

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "timeline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["timeline_id"], :name => "index_follows_on_timeline_id"
  add_index "follows", ["user_id"], :name => "index_follows_on_user_id"

  create_table "records", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "records", ["event_id"], :name => "index_records_on_event_id"
  add_index "records", ["user_id"], :name => "index_records_on_user_id"

# Could not dump table "timelines" because of following StandardError
#   Unknown type 'background' for column 'background'

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

end
