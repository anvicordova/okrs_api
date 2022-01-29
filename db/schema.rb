# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_127_205_850) do
  create_table "goals", force: :cascade do |t|
    t.string "title", limit: 180, null: false
    t.datetime "start_date", precision: 6, null: false
    t.datetime "end_date", precision: 6, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "key_results", force: :cascade do |t|
    t.string "title", limit: 180, null: false
    t.datetime "started_at", precision: 6
    t.datetime "completed_at", precision: 6
    t.integer "goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_key_results_on_goal_id"
  end

  add_foreign_key "key_results", "goals"
end
