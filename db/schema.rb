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

ActiveRecord::Schema[7.0].define(version: 2023_05_24_132255) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cell_minerals", force: :cascade do |t|
    t.integer "cell_id", null: false
    t.integer "mineral_id", null: false
    t.integer "user_id", null: false
    t.string "stage", default: "ready"
    t.datetime "final_recover_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cell_id"], name: "index_cell_minerals_on_cell_id"
    t.index ["mineral_id"], name: "index_cell_minerals_on_mineral_id"
    t.index ["user_id"], name: "index_cell_minerals_on_user_id"
  end

  create_table "cells", force: :cascade do |t|
    t.integer "plot_id", null: false
    t.integer "plant_id"
    t.string "land_type"
    t.boolean "is_taken", default: false
    t.datetime "planting_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_cells_on_plant_id"
    t.index ["plot_id"], name: "index_cells_on_plot_id"
  end

  create_table "crops", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plant_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_crops_on_plant_id"
    t.index ["user_id"], name: "index_crops_on_user_id"
  end

  create_table "fish", force: :cascade do |t|
    t.integer "level"
    t.integer "experience"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: false
    t.index ["user_id"], name: "index_fish_on_user_id"
  end

  create_table "growing_seeds", force: :cascade do |t|
    t.integer "cell_id", null: false
    t.integer "plant_id", null: false
    t.integer "growing_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.datetime "final_grow_time"
    t.string "stage", default: "growing"
    t.index ["cell_id"], name: "index_growing_seeds_on_cell_id"
    t.index ["plant_id"], name: "index_growing_seeds_on_plant_id"
    t.index ["user_id"], name: "index_growing_seeds_on_user_id"
  end

  create_table "instrument_stocks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "instrument_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_instrument_stocks_on_instrument_id"
    t.index ["user_id"], name: "index_instrument_stocks_on_user_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mineral_stocks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mineral_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mineral_id"], name: "index_mineral_stocks_on_mineral_id"
    t.index ["user_id"], name: "index_mineral_stocks_on_user_id"
  end

  create_table "minerals", force: :cascade do |t|
    t.string "name"
    t.integer "recovery_time"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seed_price", null: false
    t.integer "growing_time", null: false
    t.integer "experience"
    t.text "description"
    t.integer "rarity"
  end

  create_table "plots", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plots_on_user_id"
  end

  create_table "recipe_plants", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "plant_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_recipe_plants_on_plant_id"
    t.index ["recipe_id"], name: "index_recipe_plants_on_recipe_id"
  end

  create_table "recipe_stocks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_stocks_on_recipe_id"
    t.index ["user_id"], name: "index_recipe_stocks_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "material_type"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "seed_stocks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plant_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_seed_stocks_on_plant_id"
    t.index ["user_id"], name: "index_seed_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "dsc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cell_minerals", "cells"
  add_foreign_key "cell_minerals", "minerals"
  add_foreign_key "cell_minerals", "users"
  add_foreign_key "cells", "plants"
  add_foreign_key "cells", "plots"
  add_foreign_key "crops", "plants"
  add_foreign_key "crops", "users"
  add_foreign_key "fish", "users"
  add_foreign_key "growing_seeds", "cells"
  add_foreign_key "growing_seeds", "plants"
  add_foreign_key "growing_seeds", "users"
  add_foreign_key "instrument_stocks", "instruments"
  add_foreign_key "instrument_stocks", "users"
  add_foreign_key "mineral_stocks", "minerals"
  add_foreign_key "mineral_stocks", "users"
  add_foreign_key "plots", "users"
  add_foreign_key "recipe_plants", "plants"
  add_foreign_key "recipe_plants", "recipes"
  add_foreign_key "recipe_stocks", "recipes"
  add_foreign_key "recipe_stocks", "users"
  add_foreign_key "resources", "users"
  add_foreign_key "seed_stocks", "plants"
  add_foreign_key "seed_stocks", "users"
  add_foreign_key "wallets", "users"
end
