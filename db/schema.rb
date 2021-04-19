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

ActiveRecord::Schema.define(version: 2021_04_19_063342) do

  create_table "bccs", primary_key: "mail_id", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "read_status", default: false
    t.boolean "snoozed_status", default: false
    t.boolean "important_status", default: false
    t.boolean "starred_status", default: false
    t.boolean "trash_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50, default: "new category", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "css", primary_key: "mail_id", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "read_status", default: false
    t.boolean "snoozed_status", default: false
    t.boolean "important_status", default: false
    t.boolean "starred_status", default: false
    t.boolean "trash_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emails", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.integer "category_id"
    t.text "message"
    t.boolean "status", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receivers", primary_key: "mail_id", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "read_status", default: false
    t.boolean "snoozed_status", default: false
    t.boolean "important_status", default: false
    t.boolean "starred_status", default: false
    t.boolean "trash_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "senders", primary_key: "mail_id", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", limit: 50, null: false
    t.boolean "read_status", default: false
    t.boolean "snoozed_status", default: false
    t.boolean "important_status", default: false
    t.boolean "starred_status", default: false
    t.boolean "trash_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
