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

ActiveRecord::Schema.define(version: 20191002050016) do

  create_table "ballots", force: :cascade do |t|
    t.integer "trial_id"
    t.integer "p_points"
    t.integer "d_points"
    t.integer "attorney_1_id"
    t.integer "attorney_2_id"
    t.integer "attorney_3_id"
    t.integer "witness_1_id"
    t.integer "witness_2_id"
    t.integer "witness_3_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tiebreaker_p_won"
    t.index ["attorney_1_id"], name: "index_ballots_on_attorney_1_id"
    t.index ["attorney_2_id"], name: "index_ballots_on_attorney_2_id"
    t.index ["attorney_3_id"], name: "index_ballots_on_attorney_3_id"
    t.index ["trial_id"], name: "index_ballots_on_trial_id"
    t.index ["witness_1_id"], name: "index_ballots_on_witness_1_id"
    t.index ["witness_2_id"], name: "index_ballots_on_witness_2_id"
    t.index ["witness_3_id"], name: "index_ballots_on_witness_3_id"
  end

  create_table "judge_ballots", force: :cascade do |t|
    t.boolean "p_won"
    t.integer "trial_id"
    t.integer "attorney_1_id"
    t.integer "attorney_2_id"
    t.integer "attorney_3_id"
    t.integer "witness_1_id"
    t.integer "witness_2_id"
    t.integer "witness_3_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attorney_1_id"], name: "index_judge_ballots_on_attorney_1_id"
    t.index ["attorney_2_id"], name: "index_judge_ballots_on_attorney_2_id"
    t.index ["attorney_3_id"], name: "index_judge_ballots_on_attorney_3_id"
    t.index ["trial_id"], name: "index_judge_ballots_on_trial_id"
    t.index ["witness_1_id"], name: "index_judge_ballots_on_witness_1_id"
    t.index ["witness_2_id"], name: "index_judge_ballots_on_witness_2_id"
    t.index ["witness_3_id"], name: "index_judge_ballots_on_witness_3_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "team_id"
    t.string "name"
    t.integer "p_attorney_ranks", default: 0
    t.integer "d_attorney_ranks", default: 0
    t.integer "p_witness_ranks", default: 0
    t.integer "d_witness_ranks", default: 0
    t.index ["team_id"], name: "index_students_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "courtroom_artist"
    t.boolean "registered", default: false
    t.string "team_identifier", default: "AAA", null: false
    t.integer "points", default: 0, null: false
    t.integer "point_differential", default: 0, null: false
    t.integer "ballots", default: 0, null: false
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "trials", force: :cascade do |t|
    t.integer "p_team_id"
    t.integer "d_team_id"
    t.boolean "scored", default: false
    t.integer "ballot_1_id"
    t.integer "ballot_2_id"
    t.integer "judge_ballot_id"
    t.integer "round", default: 1
    t.index ["ballot_1_id"], name: "index_trials_on_ballot_1_id"
    t.index ["ballot_2_id"], name: "index_trials_on_ballot_2_id"
    t.index ["d_team_id"], name: "index_trials_on_d_team_id"
    t.index ["judge_ballot_id"], name: "index_trials_on_judge_ballot_id"
    t.index ["p_team_id"], name: "index_trials_on_p_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "password_digest"
    t.boolean "paid_registration"
    t.boolean "paid_tournament"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

end
