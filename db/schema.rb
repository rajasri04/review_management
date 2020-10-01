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

ActiveRecord::Schema.define(version: 20200509033159) do

# Could not dump table "abstracts" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["role_id"], name: "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "associates", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "messages" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "panel_staffs", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "panel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "panel_staffs", ["panel_id"], name: "index_panel_staffs_on_panel_id"
  add_index "panel_staffs", ["staff_id"], name: "index_panel_staffs_on_staff_id"

  create_table "panels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "panels_staffs", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "panel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "panels_staffs", ["panel_id", "staff_id"], name: "index_panels_staffs_on_panel_id_and_staff_id", unique: true
  add_index "panels_staffs", ["panel_id"], name: "index_panels_staffs_on_panel_id"
  add_index "panels_staffs", ["staff_id"], name: "index_panels_staffs_on_staff_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "staff_id"
    t.integer  "marks"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "review0"
    t.integer  "review1"
    t.integer  "review2"
    t.integer  "review3"
    t.boolean  "approved"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "staff_id"
    t.integer  "panel_id"
    t.integer  "group_id"
  end

  create_table "relates", force: :cascade do |t|
    t.integer "student_id"
    t.integer "staff_id"
  end

  add_index "relates", ["student_id", "staff_id"], name: "index_relates_on_student_id_and_staff_id", unique: true

  create_table "relations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "relations", ["student_id", "staff_id"], name: "index_relations_on_student_id_and_staff_id", unique: true

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_panels", id: false, force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "panel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "staff_panels", ["panel_id"], name: "index_staff_panels_on_panel_id"
  add_index "staff_panels", ["staff_id"], name: "index_staff_panels_on_staff_id"

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "emp_id"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "staffs_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "staff_id",   null: false
  end

  add_index "staffs_students", ["student_id", "staff_id"], name: "index_staffs_students_on_student_id_and_staff_id", unique: true

  create_table "staffs_studentsses", force: :cascade do |t|
  end

  create_table "student_groups", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_groups", ["group_id"], name: "index_student_groups_on_group_id"
  add_index "student_groups", ["student_id"], name: "index_student_groups_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "reg_no",          limit: 8
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "password_digest"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
