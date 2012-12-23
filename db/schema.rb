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

ActiveRecord::Schema.define(:version => 20121223063140) do

  create_table "cars", :force => true do |t|
    t.string   "mark"
    t.string   "model"
    t.string   "thumbnailurl"
    t.string   "picture"
    t.text     "comment"
    t.integer  "cc"
    t.integer  "kmpassed"
    t.boolean  "automatic"
    t.boolean  "centerlock"
    t.boolean  "powersteering"
    t.boolean  "abs"
    t.boolean  "electricwindow"
    t.boolean  "airbag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "mobile"
    t.string   "location"
    t.string   "pricture"
    t.string   "thumbnail"
    t.string   "authority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
