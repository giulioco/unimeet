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

ActiveRecord::Schema.define(version: 20180205201317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "project_owner_id", null: false
    t.text "description", null: false
    t.datetime "recruitment_deadline"
    t.integer "max_size", null: false
    t.string "activity_id"
    t.text "activity_logo_url"
    t.string "requirements", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_owner_id"], name: "index_activities_on_project_owner_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "match_id", null: false
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.index ["activity_id"], name: "index_matches_on_activity_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name", default: ""
    t.string "last_name"
    t.string "profile_pic_url", default: ""
    t.text "bio", default: ""
    t.string "college_location", default: ""
    t.string "interests", default: [], array: true
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
