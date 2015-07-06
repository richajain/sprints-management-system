# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150703103652) do

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.date     "start_date"
    t.date     "finish_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "manager"
    t.integer  "user_id"
    t.integer  "current_sprint"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.text     "text"
    t.integer  "status"
    t.integer  "sprints"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "points"
    t.integer  "start_sprint"
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
  end

  create_table "works", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "users_id"
    t.integer  "projects_id"
  end

  add_index "works", ["projects_id"], name: "index_works_on_projects_id"
  add_index "works", ["users_id"], name: "index_works_on_users_id"

end
