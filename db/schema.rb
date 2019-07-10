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

ActiveRecord::Schema.define(version: 2019_07_08_091841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backgrounds", force: :cascade do |t|
    t.bigint "student_id"
    t.string "name"
    t.text "description"
    t.datetime "beginning"
    t.datetime "ending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_backgrounds_on_student_id"
  end

  create_table "cover_letters", force: :cascade do |t|
    t.bigint "student_id"
    t.string "object"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_cover_letters_on_student_id"
  end

  create_table "entreprises", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.string "adress"
    t.string "person"
    t.string "titre"
    t.string "juridique"
    t.string "phone"
    t.string "email"
    t.string "web"
    t.string "ville1"
    t.string "ville2"
    t.string "country"
    t.string "secteur"
    t.string "other"
    t.string "siret"
    t.bigint "user_id"
    t.boolean "check", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entreprises_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.bigint "student_id"
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_languages_on_student_id"
  end

  create_table "programming_languages", force: :cascade do |t|
    t.bigint "student_id"
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_programming_languages_on_student_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "student_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_skills_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.datetime "birthdate"
    t.string "tel"
    t.text "summary"
    t.text "hobbies"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
