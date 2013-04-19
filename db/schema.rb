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

ActiveRecord::Schema.define(:version => 20130418011152) do

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_sets", :force => true do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "match_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "game_set_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "hangouts", :force => true do |t|
    t.integer  "league_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hangouts_teams", :id => false, :force => true do |t|
    t.integer "hangout_id"
    t.integer "team_id"
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.string   "league_type"
    t.integer  "games_per_set"
    t.integer  "sets_per_match"
    t.integer  "competition_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "hangout_id"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players_teams", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "player_id"
  end

  create_table "plays_ins", :force => true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.boolean  "won"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "registrations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "league_id"
    t.integer  "team_id"
    t.decimal  "rating"
  end

  create_table "score_types", :force => true do |t|
    t.integer  "competition_id"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "mandatory"
    t.boolean  "high_scored"
    t.boolean  "primary"
  end

  create_table "scores", :force => true do |t|
    t.integer  "score_type_id"
    t.integer  "plays_in_id"
    t.float    "score_value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
