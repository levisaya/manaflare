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

ActiveRecord::Schema.define(version: 20150916021225) do

  create_table "card_sets", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "borderColor"
    t.date     "releaseDate"
    t.string   "set_type"
    t.string   "block"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: true do |t|
    t.string   "layout"
    t.string   "card_type"
    t.integer  "cmc"
    t.string   "rarity"
    t.string   "artist"
    t.integer  "power"
    t.integer  "toughness"
    t.string   "manaCost"
    t.string   "string"
    t.string   "text"
    t.string   "flavor"
    t.integer  "number"
    t.string   "watermark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
    t.integer  "cardSet_id"
  end

  add_index "printings", ["cardSet_id"], name: "index_printings_on_cardSet_id"
  add_index "printings", ["card_id"], name: "index_printings_on_card_id"

  create_table "rulings", force: true do |t|
    t.date     "date"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
  end

  add_index "rulings", ["card_id"], name: "index_rulings_on_card_id"

end
