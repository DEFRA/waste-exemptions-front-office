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

ActiveRecord::Schema.define(version: 20181218182531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.string   "workflow_state"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "start_option"
    t.string   "location"
    t.string   "applicant_first_name"
    t.string   "applicant_last_name"
    t.string   "applicant_phone"
    t.string   "applicant_email"
    t.string   "business_type"
    t.string   "token"
    t.string   "operator_name"
    t.string   "company_no"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_position"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.boolean  "is_a_farm"
    t.boolean  "on_a_farm"
  end

  add_index "enrollments", ["token"], name: "index_enrollments_on_token", unique: true, using: :btree

  create_table "interims", force: :cascade do |t|
    t.string   "operator_postcode"
    t.boolean  "address_finder_error", default: false
    t.integer  "enrollment_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "interims", ["enrollment_id"], name: "index_interims_on_enrollment_id", using: :btree

  add_foreign_key "interims", "enrollments"
end
