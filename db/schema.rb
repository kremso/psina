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

ActiveRecord::Schema.define(version: 20130603091055) do

  create_table "jokes", force: true do |t|
    t.text     "body"
    t.boolean  "published",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title",                      null: false
    t.text     "advice"
    t.text     "author",                     null: false
    t.text     "email",                      null: false
    t.integer  "rating"
    t.text     "comment"
    t.boolean  "badge",      default: false, null: false
  end

  add_index "jokes", ["published"], name: "index_jokes_on_published", using: :btree

  create_table "jokes_tags", force: true do |t|
    t.integer "joke_id"
    t.integer "tag_id"
  end

  add_index "jokes_tags", ["joke_id", "tag_id"], name: "index_jokes_tags_on_joke_id_and_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.text     "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["label"], name: "index_tags_on_label", unique: true, using: :btree

  add_foreign_key "jokes_tags", "jokes", :name => "jokes_tags_joke_id_fk"
  add_foreign_key "jokes_tags", "tags", :name => "jokes_tags_tag_id_fk"

end
