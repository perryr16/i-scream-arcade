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

ActiveRecord::Schema.define(version: 2020_07_22_135447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fear_quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fear_quizzes_on_user_id"
  end

  create_table "fear_ratings", force: :cascade do |t|
    t.bigint "game_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_fear_ratings_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.integer "age_rating"
    t.float "agg_rating"
    t.text "artworks", default: [], array: true
    t.integer "category"
    t.string "cover"
    t.integer "follows"
    t.text "game_modes", default: [], array: true
    t.integer "hypes"
    t.text "companies", default: [], array: true
    t.text "keywords", default: [], array: true
    t.text "multiplayer_modes", default: [], array: true
    t.text "player_perspective", default: [], array: true
    t.float "popularity"
    t.float "rating"
    t.integer "rating_count"
    t.text "release_date", default: [], array: true
    t.text "screenshots", default: [], array: true
    t.text "similar_games", default: [], array: true
    t.string "storyline"
    t.text "themes", default: [], array: true
    t.float "total_rating"
    t.string "url"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "game_id"
    t.string "content"
    t.integer "user_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_reviews_on_game_id"
  end

  create_table "user_games", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_user_games_on_game_id"
    t.index ["user_id"], name: "index_user_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "google_token"
    t.string "email"
    t.string "photo", default: "https://ftnj.com/wp-content/uploads/2018/09/female-headshot-silhouette.jpg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fear_quizzes", "users"
  add_foreign_key "fear_ratings", "games"
  add_foreign_key "reviews", "games"
  add_foreign_key "user_games", "games"
  add_foreign_key "user_games", "users"
end
