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

ActiveRecord::Schema.define(version: 2019_10_22_112147) do

  create_table "album_songs", force: :cascade do |t|
    t.integer "song_id"
    t.integer "album_id"
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_songs_on_album_id"
    t.index ["song_id"], name: "index_album_songs_on_song_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.date "release"
    t.boolean "single"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.string "title"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lives", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setlists", force: :cascade do |t|
    t.integer "concert_id"
    t.integer "song_id"
    t.date "date"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_setlists_on_concert_id"
    t.index ["song_id"], name: "index_setlists_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.date "release"
    t.string "lyricist"
    t.string "composer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
