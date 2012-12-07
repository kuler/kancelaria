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

ActiveRecord::Schema.define(:version => 20121207224620) do

  create_table "cases", :force => true do |t|
    t.string   "name"
    t.datetime "created"
    t.boolean  "active"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "shortname"
    t.string   "fullname"
    t.boolean  "active"
    t.string   "contact"
    t.string   "nip"
    t.string   "regon"
    t.string   "address"
    t.datetime "created"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status"
    t.integer  "priority"
    t.datetime "created"
    t.datetime "assigned"
    t.datetime "finished"
    t.boolean  "active"
    t.integer  "total"
    t.integer  "invoice"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "active"
    t.boolean  "admin"
    t.datetime "created"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
