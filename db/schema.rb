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

ActiveRecord::Schema[7.1].define(version: 2024_05_08_173150) do
  create_schema "math_trainer"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_fights", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "fight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_fights_on_answer_id"
    t.index ["fight_id"], name: "index_answer_fights_on_fight_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "problem_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.bigint "card_session_id"
    t.index ["card_session_id"], name: "index_answers_on_card_session_id"
    t.index ["problem_id"], name: "index_answers_on_problem_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "answers_sessions", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "time_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answers_sessions_on_answer_id"
    t.index ["time_session_id"], name: "index_answers_sessions_on_time_session_id"
  end

  create_table "card_session_problems", force: :cascade do |t|
    t.bigint "problem_id", null: false
    t.bigint "card_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_session_id"], name: "index_card_session_problems_on_card_session_id"
    t.index ["problem_id"], name: "index_card_session_problems_on_problem_id"
  end

  create_table "card_sessions", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_card_sessions_on_user_id"
  end

  create_table "fight_opponents", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "speed"
    t.integer "color_rot"
    t.jsonb "operation_types", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "fight_opponent_id", null: false
    t.bigint "user_id", null: false
    t.integer "remaining_player_health"
    t.integer "remaining_opponent_health"
    t.integer "round_duration"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_opponent_id"], name: "index_fights_on_fight_opponent_id"
    t.index ["user_id"], name: "index_fights_on_user_id"
  end

  create_table "answer_fights", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "fight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_math_trainer_answer_fights_on_answer_id"
    t.index ["fight_id"], name: "index_math_trainer_answer_fights_on_fight_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "problem_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.bigint "card_session_id"
    t.index ["card_session_id"], name: "index_math_trainer_answers_on_card_session_id"
    t.index ["problem_id"], name: "index_math_trainer_answers_on_problem_id"
    t.index ["user_id"], name: "index_math_trainer_answers_on_user_id"
  end

  create_table "answers_sessions", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "time_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_math_trainer_answers_sessions_on_answer_id"
    t.index ["time_session_id"], name: "index_math_trainer_answers_sessions_on_time_session_id"
  end

  create_table "card_session_problems", force: :cascade do |t|
    t.bigint "problem_id", null: false
    t.bigint "card_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_session_id"], name: "index_math_trainer_card_session_problems_on_card_session_id"
    t.index ["problem_id"], name: "index_math_trainer_card_session_problems_on_problem_id"
  end

  create_table "card_sessions", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_math_trainer_card_sessions_on_user_id"
  end

  create_table "fight_opponents", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "speed"
    t.integer "color_rot"
    t.jsonb "operation_types", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "fight_opponent_id", null: false
    t.bigint "user_id", null: false
    t.integer "remaining_player_health"
    t.integer "remaining_opponent_health"
    t.integer "round_duration"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_opponent_id"], name: "index_math_trainer_fights_on_fight_opponent_id"
    t.index ["user_id"], name: "index_math_trainer_fights_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "type"
    t.integer "number_1"
    t.integer "number_2"
    t.integer "hole_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "operation_types", default: {}
    t.boolean "shuffle_hole_position", default: false
    t.index ["user_id"], name: "index_math_trainer_time_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "DeviseCreateUsers"
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "uuid"
    t.index ["confirmation_token"], name: "index_math_trainer_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_math_trainer_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_math_trainer_users_on_reset_password_token", unique: true
    t.index ["uuid"], name: "index_math_trainer_users_on_uuid", unique: true
  end

  create_table "problems", force: :cascade do |t|
    t.string "type"
    t.integer "number_1"
    t.integer "number_2"
    t.integer "hole_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "operation_types", default: {}
    t.boolean "shuffle_hole_position", default: false
    t.index ["user_id"], name: "index_time_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "DeviseCreateUsers"
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "uuid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "answer_fights", "answers"
  add_foreign_key "answer_fights", "fights"
  add_foreign_key "answers", "card_sessions"
  add_foreign_key "answers", "problems"
  add_foreign_key "answers", "users"
  add_foreign_key "answers_sessions", "answers"
  add_foreign_key "answers_sessions", "time_sessions"
  add_foreign_key "card_session_problems", "card_sessions"
  add_foreign_key "card_session_problems", "problems"
  add_foreign_key "card_sessions", "users"
  add_foreign_key "fights", "fight_opponents"
  add_foreign_key "fights", "users"
  add_foreign_key "time_sessions", "users"
end
