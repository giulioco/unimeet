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

ActiveRecord::Schema.define(version: 20180201062400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.references "user", null:false
    t.references "activity", null:false
  end

  create_table "activities", force: :cascade do |t|
    t.references "project_owner", null:false
    t.string "name", null:false
    t.text "description", null:false
    t.datetime "recruitment_deadline"
    t.integer "max_size"
    t.string "activity_id"
    t.text "activity_logo_url"
    t.string "requirements", array:true, default: []
    t.references "members", array:true, default: []
    
    t.index ["activity_id"], name: "index_activities_on_activity_id", unique: true
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
    t.string "name", default: "", null: false
    t.string "profile_pic_url", default: "", null: false
    t.text "bio", default: "", null: false
    t.string "college_location", default: "", null: false
    t.string "interests", array:true, default:[]
    t.references "matches", array:true, default:[]
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
