class AddAssociations < ActiveRecord::Migration
  def change
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
        t.belongs_to :card, index:true
        t.belongs_to :cardSet, index:true
    end

    create_table "rulings", force: true do |t|
        t.date     "date"
        t.string   "name"
        t.datetime "created_at"
        t.datetime "updated_at"
        t.belongs_to :card, index:true
    end
  end
end
