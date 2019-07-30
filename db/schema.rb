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
    t.text "content", default: "<p align=\"left\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ton prénom et nom]</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ton adresse]</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ton téléphone]</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ton email]</span></p><br style=\"color: rgb(51, 51, 51);\"><p align=\"right\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Nom de l'entreprise]</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Nom/prénom/poste du destinataire]</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Adresse de l'entreprise]</span>&nbsp;<br></p><p align=\"right\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ville]</span>, le&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[date]</span></p><br style=\"color: rgb(51, 51, 51);\"><p class=\"weight-bold\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><b>Objet</b><span style=\"font-weight: 700;\"> : Candidature au poste de&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[nom du poste auquel tu postules]</span></span></p><br style=\"color: rgb(51, 51, 51);\"><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Madame, Monsieur,</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Par le biais de la présente et du CV ci-joint, je souhaite vous soumettre mon profil et vous exprimer toute ma motivation pour exercer les fonctions de&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[emploi pour lequel tu postules]</span>&nbsp;au sein de votre service de&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[service pour lequel tu postules]</span>.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Lors de mes dernières expériences professionnelles, j’ai travaillé pour différentes entreprises du secteur&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[secteur ou secteurs dans lesquels tu as travaillé]</span>, où j’ai pu acquérir et développer de solides connaissances en&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[mentionne les programmes ou les domaines dans lesquels tu as acquis des connaissances]</span>, entre autres, que j’aimerais partager avec vous et continuer à approfondir au sein d’une équipe dynamique et stimulante.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Au cours de ma dernière expérience professionnelle à/chez&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[dernière entreprise dans laquelle tu as travaillé]</span>, j’ai également eu l’occasion de contribuer au développement de différents projets, raison pour laquelle le fait de continuer à travailler au lancement de nouvelles idées et d’apprendre aux côtés d’une nouvelle équipe me motive énormément.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Je serai ravi(e) de vous rencontrer à l’avenir pour pouvoir parler de votre entreprise et de la mission proposée.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">En vous remerciant pour le temps que vous aurez bien voulu accorder à ma lettre, je vous prie de bien vouloir agréer, madame, monsieur, mes plus cordiales salutations.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ton prénom et nom]</span></p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ta signature]</span></p>"
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
    t.string "developer_type", default: "Développeur Web"
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
    t.integer "level", default: 3
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
    t.integer "level", default: 3
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
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_staffs_on_company_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id"
    t.string "firstname"
    t.string "lastname"
    t.string "sexe", default: "non spécifié"
    t.string "marital_status", default: "compliqué"
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
  end

  add_foreign_key "backgrounds", "cvs"
  add_foreign_key "experiences", "cvs"
  add_foreign_key "staffs", "companies"
end
