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

ActiveRecord::Schema[7.0].define(version: 2026_01_28_000000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "authorizations", force: :cascade do |t|
    t.bigint "player_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_authorizations_on_player_id"
    t.index ["provider", "uid"], name: "index_authorizations_on_provider_and_uid"
  end

  create_table "championships", force: :cascade do |t|
    t.bigint "sport_id"
    t.string "code"
    t.string "name"
    t.string "description"
    t.index ["sport_id"], name: "index_championships_on_sport_id"
  end

  create_table "day_players", force: :cascade do |t|
    t.bigint "season_id"
    t.bigint "day_id"
    t.bigint "player_id"
    t.bigint "team_id"
    t.float "elo", default: 1500.0
    t.index ["day_id"], name: "index_day_players_on_day_id"
    t.index ["player_id"], name: "index_day_players_on_player_id"
    t.index ["season_id"], name: "index_day_players_on_season_id"
    t.index ["team_id"], name: "index_day_players_on_team_id"
  end

  create_table "days", force: :cascade do |t|
    t.bigint "season_id"
    t.date "date"
    t.integer "first_place"
    t.integer "second_place"
    t.integer "third_place"
    t.integer "fourth_place"
    t.string "videos", default: ""
    t.index ["season_id"], name: "index_days_on_season_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "day_id"
    t.integer "team_left_id"
    t.integer "team_right_id"
    t.integer "goals_left", default: 0
    t.integer "goals_right", default: 0
    t.integer "left_team_elo", default: 0
    t.integer "right_team_elo", default: 0
    t.integer "left_team_elo_change", default: 0
    t.integer "right_team_elo_change", default: 0
    t.string "comment"
    t.index ["day_id"], name: "index_games_on_day_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "game_id"
    t.bigint "team_id"
    t.bigint "season_id"
    t.integer "assist_player_id"
    t.index ["game_id"], name: "index_goals_on_game_id"
    t.index ["player_id"], name: "index_goals_on_player_id"
    t.index ["season_id"], name: "index_goals_on_season_id"
    t.index ["team_id"], name: "index_goals_on_team_id"
  end

  create_table "message_files", force: :cascade do |t|
    t.integer "message_id"
    t.string "url"
    t.string "file_name"
    t.string "mime_type"
    t.string "file_id"
    t.string "file_unique_id"
    t.integer "file_size"
    t.integer "width"
    t.integer "height"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "uid"
    t.string "username"
    t.text "text"
    t.integer "message_id"
    t.bigint "chat_id"
    t.datetime "date"
    t.integer "reply_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "middlename"
    t.string "phone"
    t.string "uid"
    t.string "provider", default: "telegram"
    t.string "lfl"
    t.string "token"
    t.string "email", default: ""
    t.integer "code"
    t.date "birthday"
    t.bigint "role_id"
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "elo"
    t.index ["role_id"], name: "index_players_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "code"
    t.string "name"
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "championship_id"
    t.string "code"
    t.string "name"
    t.string "description"
    t.boolean "active", default: true
    t.index ["championship_id"], name: "index_seasons_on_championship_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "player_id"
    t.integer "season_id"
    t.integer "days"
    t.integer "games"
    t.integer "win"
    t.integer "draw"
    t.integer "lose"
    t.float "elo", default: 1500.0
  end

  create_table "teams", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "num"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "authorizations", "players"
end
