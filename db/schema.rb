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

ActiveRecord::Schema.define(version: 2021_07_24_041145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dummy_repetition_collections", force: :cascade do |t|
    t.bigint "dummy_repetition_id"
    t.integer "set_value"
    t.boolean "percent_based"
    t.integer "rep_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dummy_repetition_id"], name: "index_dummy_repetition_collections_on_dummy_repetition_id"
  end

  create_table "dummy_repetitions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dummy_workout_collections", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "dummy_repetition_id"
    t.bigint "dummy_workout_id"
    t.string "athlete_notes"
    t.string "coach_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dummy_workout_id"], name: "index_dummy_workout_collections_on_dummy_workout_id"
  end

  create_table "dummy_workouts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "workout_notes"
    t.bigint "program_day_id"
    t.boolean "active_day"
    t.boolean "workout_complete"
    t.boolean "workout_missed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_day_id"], name: "index_dummy_workouts_on_program_day_id"
    t.index ["user_id"], name: "index_dummy_workouts_on_user_id"
  end

  create_table "exercise_collections", force: :cascade do |t|
    t.bigint "program_workout_id"
    t.integer "exercise_id"
    t.integer "repetition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_workout_id"], name: "index_exercise_collections_on_program_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.integer "primary_muscle"
    t.integer "secondary_muscle"
    t.integer "region_id"
    t.boolean "primary_exercise"
    t.boolean "accessory_exercise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "max_efforts", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "exercise_id"
    t.integer "max_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_max_efforts_on_user_id"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "muscle_title"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "program_days", force: :cascade do |t|
    t.string "title"
    t.bigint "program_week_id"
    t.boolean "active_day"
    t.integer "dummy_workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_week_id"], name: "index_program_days_on_program_week_id"
  end

  create_table "program_weeks", force: :cascade do |t|
    t.string "title"
    t.bigint "program_id"
    t.boolean "active_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_weeks_on_program_id"
  end

  create_table "program_workouts", force: :cascade do |t|
    t.string "title"
    t.string "workout_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.integer "number_of_weeks"
    t.integer "days_per_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repetition_collections", force: :cascade do |t|
    t.bigint "repetition_id"
    t.integer "set_value"
    t.boolean "percent_based"
    t.integer "rep_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repetition_id"], name: "index_repetition_collections_on_repetition_id"
  end

  create_table "repetitions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_repetitions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_role"
    t.integer "current_day"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dummy_repetition_collections", "dummy_repetitions"
  add_foreign_key "dummy_workout_collections", "dummy_workouts"
  add_foreign_key "dummy_workouts", "program_days"
  add_foreign_key "dummy_workouts", "users"
  add_foreign_key "exercise_collections", "program_workouts"
  add_foreign_key "exercises", "users"
  add_foreign_key "max_efforts", "users"
  add_foreign_key "program_days", "program_weeks"
  add_foreign_key "program_weeks", "programs"
  add_foreign_key "programs", "users"
  add_foreign_key "repetition_collections", "repetitions"
  add_foreign_key "repetitions", "users"
end
