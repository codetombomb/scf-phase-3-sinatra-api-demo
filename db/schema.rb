# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_15_170430) do

  create_table "game_item_cards", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "item_card_id", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "complete", default: false
    t.integer "moves"
    t.integer "wrong_moves"
    t.string "difficulty"
    t.integer "total_time_seconds"
  end

  create_table "item_card_locations", force: :cascade do |t|
    t.integer "item_card_id", null: false
    t.integer "location_id", null: false
  end

  create_table "item_cards", force: :cascade do |t|
    t.string "image_url"
    t.integer "compendium_id"
    t.string "name"
    t.string "description"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
  end

end
