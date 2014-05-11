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

ActiveRecord::Schema.define(:version => 20140511215015) do

  create_table "beers", :force => true do |t|
    t.string    "guid"
    t.string    "name"
    t.text      "description"
    t.float     "abv",                :limit => nil
    t.integer   "ibu"
    t.boolean   "is_organic"
    t.string    "label_url"
    t.string    "style_id"
    t.integer   "brewery_id"
    t.timestamp "remote_update_date"
    t.timestamp "created_at",                        :null => false
    t.timestamp "updated_at",                        :null => false
  end

  add_index "BEERS", ["ID"], :name => "beers..primary_key", :length => {"ID"=>4}

  create_table "breweries", :force => true do |t|
    t.string    "guid"
    t.string    "name"
    t.text      "description"
    t.string    "website"
    t.integer   "established"
    t.boolean   "is_organic"
    t.string    "image_url"
    t.timestamp "remote_update_date"
    t.timestamp "created_at",         :null => false
    t.timestamp "updated_at",         :null => false
  end

  add_index "BREWERIES", ["ID"], :name => "breweries..primary_key", :length => {"ID"=>4}

  create_table "categories", :force => true do |t|
    t.string    "name"
    t.string    "guid"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "CATEGORIES", ["ID"], :name => "categories..primary_key", :length => {"ID"=>4}

  create_table "kegs", :force => true do |t|
    t.integer   "beer_id"
    t.timestamp "start_date"
    t.timestamp "end_date"
    t.boolean   "is_on_tap",  :default => false
    t.timestamp "created_at",                    :null => false
    t.timestamp "updated_at",                    :null => false
    t.integer   "tap_id"
  end

  add_index "KEGS", ["ID"], :name => "kegs..primary_key", :length => {"ID"=>4}

  create_table "styles", :force => true do |t|
    t.integer   "category_id"
    t.string    "name"
    t.text      "description"
    t.string    "guid"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  add_index "STYLES", ["ID"], :name => "styles..primary_key", :length => {"ID"=>4}

  create_table "taps", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "TAPS", ["ID"], :name => "taps..primary_key", :length => {"ID"=>4}

end
