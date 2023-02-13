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

ActiveRecord::Schema[7.0].define(version: 2023_03_06_145609) do
  create_table "fish", force: :cascade do |t|
    t.integer "level"
    t.integer "experience"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fish_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "price"
    t.integer "growing_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plots", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plant_id"
    t.string "type"
    t.boolean "is_taken"
    t.datetime "planting_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_plots_on_plant_id"
    t.index ["user_id"], name: "index_plots_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "type"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "seeds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.integer "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_seeds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fish", "users"
  add_foreign_key "plots", "plants"
  add_foreign_key "plots", "users"
  add_foreign_key "resources", "users"
  add_foreign_key "seeds", "users"
end
