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

ActiveRecord::Schema.define(version: 20180801004255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_logs", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "exercise_id", null: false
    t.jsonb "data", default: {}, null: false
    t.index ["exercise_id"], name: "index_exercise_logs_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_logs_on_workout_id"
  end

  create_table "exercise_targets", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "muscle_group_id", null: false
    t.index ["exercise_id"], name: "index_exercise_targets_on_exercise_id"
    t.index ["muscle_group_id"], name: "index_exercise_targets_on_muscle_group_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", default: "", null: false
    t.string "video_embed_url", default: "", null: false
    t.string "image_url", null: false
    t.index ["name"], name: "index_exercises_on_name", unique: true
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "email", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "profile_image_url", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "day", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercise_logs", "exercises"
  add_foreign_key "exercise_logs", "workouts"
  add_foreign_key "exercise_targets", "exercises"
  add_foreign_key "exercise_targets", "muscle_groups"
end
