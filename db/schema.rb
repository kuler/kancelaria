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

ActiveRecord::Schema.define(:version => 20130101170848) do

  create_table "cases", :force => true do |t|
    t.string   "name",                              :null => false
    t.boolean  "active",          :default => true
    t.text     "description"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "user_id",                           :null => false
    t.integer  "client_id",                         :null => false
    t.string   "files_signature"
  end

  create_table "clients", :force => true do |t|
    t.string   "shortname",                    :null => false
    t.string   "fullname"
    t.boolean  "active",     :default => true
    t.string   "contact"
    t.string   "nip"
    t.string   "regon"
    t.string   "address"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "user_id",                      :null => false
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.string   "email"
    t.string   "website"
  end

  create_table "task_types", :force => true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name",                                  :null => false
    t.text     "description"
    t.integer  "priority"
    t.datetime "assigned_at"
    t.float    "hours_invoice",        :default => 0.0, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.datetime "planned_to_start_at"
    t.integer  "task_type_id"
    t.integer  "case_id"
    t.integer  "author_user_id",                        :null => false
    t.integer  "assignee_user_id"
    t.boolean  "is_activity"
    t.string   "files_signature"
    t.datetime "started_at"
    t.datetime "planned_to_finish_at"
    t.datetime "finished_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "password",                      :null => false
    t.string   "firstname",                     :null => false
    t.string   "lastname",                      :null => false
    t.boolean  "active",     :default => true,  :null => false
    t.boolean  "admin",      :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "salt"
  end

end
