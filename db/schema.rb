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

ActiveRecord::Schema.define(version: 2019_07_04_105215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_players"
    t.string "status"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.bigint "score_id"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["score_id"], name: "index_players_on_score_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "round_id"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_scores_on_player_id"
    t.index ["round_id"], name: "index_scores_on_round_id"
  end

  add_foreign_key "rounds", "games"
end
