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

ActiveRecord::Schema.define(:version => 20120830114615) do

  create_table "jokes", :force => true do |t|
    t.text     "body"
    t.boolean  "published",                 :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",      :limit => 100,                    :null => false
    t.text     "advice"
    t.string   "author",     :limit => 100,                    :null => false
    t.string   "email",      :limit => 100,                    :null => false
  end

  add_index "jokes", ["published"], :name => "index_jokes_on_published"

  create_table "jokes_tags", :force => true do |t|
    t.integer "joke_id"
    t.integer "tag_id"
  end

  add_index "jokes_tags", ["joke_id", "tag_id"], :name => "index_jokes_tags_on_joke_id_and_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "label",      :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "jokes_tags", "jokes", :name => "jokes_tags_joke_id_fk"
  add_foreign_key "jokes_tags", "tags", :name => "jokes_tags_tag_id_fk"

end
