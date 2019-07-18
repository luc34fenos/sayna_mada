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

ActiveRecord::Schema.define(version: 2019_07_16_052459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_backgrounds_on_cv_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_companies", id: false, force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "company_id"
    t.index ["city_id"], name: "index_cities_companies_on_city_id"
    t.index ["company_id"], name: "index_cities_companies_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "start_date"
    t.string "address"
    t.string "legal_status"
    t.string "tel"
    t.string "activity_area"
    t.string "siret"
    t.text "other"
    t.bigint "user_id"
    t.boolean "is_activated?", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "cover_letters", force: :cascade do |t|
    t.bigint "cv_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_cover_letters_on_cv_id"
  end

  create_table "cv_pdfs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cvs", force: :cascade do |t|
    t.bigint "student_id"
    t.text "hobbies"
    t.text "summary"
<<<<<<< HEAD
    t.string "developer_type", default: "Web"
=======
    t.string "developer_type", default: "Developpeur Web"
>>>>>>> d699aea71bea73c85ee667c0a850cd3d15acf8bc
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_cvs_on_student_id"
  end

  create_table "cvs_languages", id: false, force: :cascade do |t|
    t.bigint "cv_id", null: false
    t.bigint "language_id", null: false
    t.index ["cv_id"], name: "index_cvs_languages_on_cv_id"
    t.index ["language_id"], name: "index_cvs_languages_on_language_id"
  end

  create_table "cvs_programming_languages", id: false, force: :cascade do |t|
    t.bigint "cv_id", null: false
    t.bigint "programming_language_id", null: false
    t.index ["cv_id"], name: "index_cvs_programming_languages_on_cv_id"
    t.index ["programming_language_id"], name: "index_cvs_programming_languages_on_programming_language_id"
  end

  create_table "cvs_skills", id: false, force: :cascade do |t|
    t.bigint "cv_id", null: false
    t.bigint "skill_id", null: false
    t.index ["cv_id"], name: "index_cvs_skills_on_cv_id"
    t.index ["skill_id"], name: "index_cvs_skills_on_skill_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "cv_id"
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_experiences_on_cv_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motivational_videos", force: :cascade do |t|
    t.bigint "cv_id"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_motivational_videos_on_cv_id"
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "job"
    t.string "email"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id"
    t.string "firstname"
    t.string "lastname"
    t.string "sexe", default: "Non confirmé"
    t.string "marital_status", default: "Compliqué"
    t.datetime "birthdate"
    t.string "tel"
    t.string "address"
    t.bigint "city_id"
    t.boolean "is_activated?", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_students_on_city_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "status", default: "guest", null: false
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

  create_table "webs", force: :cascade do |t|
    t.bigint "cv_id"
    t.bigint "company_id"
    t.string "name"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_webs_on_company_id"
    t.index ["cv_id"], name: "index_webs_on_cv_id"
  end

  add_foreign_key "backgrounds", "cvs"
  add_foreign_key "experiences", "cvs"
<<<<<<< HEAD
  add_foreign_key "motivational_videos", "cvs"
=======
>>>>>>> d699aea71bea73c85ee667c0a850cd3d15acf8bc
  add_foreign_key "webs", "companies"
  add_foreign_key "webs", "cvs"
end
