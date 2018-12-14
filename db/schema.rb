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

ActiveRecord::Schema.define(version: 20181212084403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_business_contacts", id: false, force: :cascade do |t|
    t.integer "address_id",          null: false
    t.integer "business_contact_id", null: false
  end

  add_index "address_business_contacts", ["address_id"], name: "index_address_business_contacts_on_address_id", using: :btree
  add_index "address_business_contacts", ["business_contact_id"], name: "index_address_business_contacts_on_business_contact_id", using: :btree

  create_table "business_contacts", force: :cascade do |t|
    t.integer  "phone_number_id", null: false
    t.string   "email_address"
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "business_contacts", ["phone_number_id"], name: "index_business_contacts_on_phone_number_id", using: :btree

  create_table "business_details", force: :cascade do |t|
    t.string   "business_name",               null: false
    t.string   "company_registration_number"
    t.integer  "business_contact_id"
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "dsc_address_contacts", id: false, force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "contact_id", null: false
  end

  add_index "dsc_address_contacts", ["address_id"], name: "index_dsc_address_contacts_on_address_id", using: :btree
  add_index "dsc_address_contacts", ["contact_id"], name: "index_dsc_address_contacts_on_contact_id", using: :btree

  create_table "dsc_address_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dsc_addresses", force: :cascade do |t|
    t.string   "premises",            limit: 200
    t.string   "street_address",      limit: 160
    t.string   "locality",            limit: 70
    t.string   "city",                limit: 30
    t.string   "postcode",            limit: 8
    t.integer  "county_province_id"
    t.string   "country_iso",         limit: 3
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "address_type",                    default: 0,  null: false
    t.string   "organisation",        limit: 255, default: "", null: false
    t.date     "state_date"
    t.string   "blpu_state_code"
    t.string   "postal_address_code"
    t.string   "logical_status_code"
  end

  create_table "dsc_administrative_areas", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "long_name",  null: false
    t.string   "short_name"
    t.integer  "area_id"
    t.string   "area_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dsc_administrative_areas", ["code"], name: "index_dsc_administrative_areas_on_code", unique: true, using: :btree

  create_table "dsc_confirmation_letter_bulk_exports", force: :cascade do |t|
    t.date     "from_date",                         null: false
    t.date     "to_date",                           null: false
    t.string   "created_by",                        null: false
    t.integer  "document_count", default: 0,        null: false
    t.string   "file_name",                         null: false
    t.string   "state",          default: "queued", null: false
    t.text     "failure_text"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "dsc_confirmation_letter_bulk_exports", ["created_at"], name: "index_dsc_confirmation_letter_bulk_exports_on_created_at", using: :btree
  add_index "dsc_confirmation_letter_bulk_exports", ["file_name"], name: "index_dsc_confirmation_letter_bulk_exports_on_file_name", unique: true, using: :btree

  create_table "dsc_contacts", force: :cascade do |t|
    t.integer  "contact_type",                            default: 0, null: false
    t.integer  "title",                                   default: 0, null: false
    t.string   "suffix",                      limit: 255
    t.string   "first_name",                  limit: 255
    t.string   "last_name",                   limit: 255
    t.date     "date_of_birth"
    t.string   "position",                    limit: 255
    t.string   "email_address",               limit: 255
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "primary_address_id"
    t.integer  "partnership_organisation_id"
  end

  add_index "dsc_contacts", ["primary_address_id"], name: "index_dsc_contacts_on_primary_address_id", using: :btree

  create_table "dsc_county_provinces", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "country_iso", limit: 3
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "dsc_enrollment_exports", force: :cascade do |t|
    t.date     "from_date",                       null: false
    t.date     "to_date",                         null: false
    t.string   "created_by",                      null: false
    t.string   "file_name",                       null: false
    t.string   "state",        default: "queued", null: false
    t.text     "failure_text"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "record_count"
  end

  add_index "dsc_enrollment_exports", ["created_at"], name: "index_dsc_enrollment_exports_on_created_at", using: :btree
  add_index "dsc_enrollment_exports", ["file_name"], name: "index_dsc_enrollment_exports_on_file_name", unique: true, using: :btree

  create_table "dsc_enrollments", force: :cascade do |t|
    t.string   "state"
    t.boolean  "under_review",                         default: false
    t.datetime "submitted_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "exemption_id"
    t.integer  "parties_id"
    t.integer  "applicant_contact_id"
    t.integer  "correspondence_contact_id"
    t.integer  "site_address_id"
    t.integer  "on_a_farm",                            default: -1,    null: false
    t.integer  "is_a_farmer",                          default: -1,    null: false
    t.integer  "organisation_id"
    t.string   "reference_number",          limit: 12
    t.string   "token"
    t.integer  "status",                               default: 0,     null: false
    t.string   "deregistered_comment"
    t.datetime "deregistered_at"
    t.string   "assistance_mode"
    t.string   "created_by"
    t.string   "updated_by"
    t.text     "assistance_comment"
  end

  add_index "dsc_enrollments", ["applicant_contact_id"], name: "index_dsc_enrollments_on_applicant_contact_id", using: :btree
  add_index "dsc_enrollments", ["correspondence_contact_id"], name: "index_dsc_enrollments_on_correspondence_contact_id", using: :btree
  add_index "dsc_enrollments", ["exemption_id"], name: "index_dsc_enrollments_on_exemption_id", using: :btree
  add_index "dsc_enrollments", ["organisation_id"], name: "index_dsc_enrollments_on_organisation_id", using: :btree
  add_index "dsc_enrollments", ["parties_id"], name: "index_dsc_enrollments_on_parties_id", using: :btree
  add_index "dsc_enrollments", ["reference_number"], name: "index_dsc_enrollments_on_reference_number", unique: true, using: :btree
  add_index "dsc_enrollments", ["site_address_id"], name: "index_dsc_enrollments_on_site_address_id", using: :btree
  add_index "dsc_enrollments", ["state"], name: "index_dsc_enrollments_on_state", using: :btree
  add_index "dsc_enrollments", ["submitted_at"], name: "index_dsc_enrollments_on_submitted_at", using: :btree

  create_table "dsc_enrollments_exemptions", force: :cascade do |t|
    t.integer  "dsc_enrollment_id",                null: false
    t.integer  "exemption_id",                     null: false
    t.integer  "status",               default: 0
    t.integer  "site_address_id"
    t.datetime "expires_at"
    t.datetime "valid_from"
    t.text     "deregistered_comment"
    t.datetime "deregistered_at"
  end

  add_index "dsc_enrollments_exemptions", ["dsc_enrollment_id"], name: "index_dsc_enrollments_exemptions_on_dsc_enrollment_id", using: :btree
  add_index "dsc_enrollments_exemptions", ["exemption_id"], name: "index_dsc_enrollments_exemptions_on_exemption_id", using: :btree
  add_index "dsc_enrollments_exemptions", ["site_address_id"], name: "index_dsc_enrollments_exemptions_on_site_address_id", using: :btree

  create_table "dsc_locations", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "grid_reference"
    t.string   "uprn"
    t.string   "lat"
    t.string   "long"
    t.string   "x"
    t.string   "y"
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "coordinate_system"
    t.text     "site_info"
    t.boolean  "site_info_auto_generated", default: false
    t.integer  "administrative_area_id"
  end

  add_index "dsc_locations", ["administrative_area_id"], name: "index_dsc_locations_on_administrative_area_id", using: :btree

  create_table "dsc_organisations", force: :cascade do |t|
    t.string   "type"
    t.string   "name",           limit: 255
    t.integer  "contact_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "company_number", limit: 255
  end

  create_table "dsc_parties", force: :cascade do |t|
    t.string   "type"
    t.string   "description"
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dsc_phone_numbers", force: :cascade do |t|
    t.integer  "number_type",             default: 0, null: false
    t.string   "tel_number",  limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "contact_id"
  end

  add_index "dsc_phone_numbers", ["contact_id"], name: "index_dsc_phone_numbers_on_contact_id", using: :btree

  create_table "dsc_versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "dsc_versions", ["item_type", "item_id"], name: "index_dsc_versions_on_item_type_and_item_id", using: :btree

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
  end

  add_index "enrollments", ["token"], name: "index_enrollments_on_token", unique: true, using: :btree

  create_table "exemptions", force: :cascade do |t|
    t.string   "code"
    t.string   "summary"
    t.text     "description"
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "url"
    t.integer  "category",    default: 0
  end

  create_table "renewals", force: :cascade do |t|
    t.string "reference_number", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "dsc_contacts", "dsc_addresses", column: "primary_address_id"
  add_foreign_key "dsc_enrollments", "exemptions"
  add_foreign_key "dsc_locations", "dsc_administrative_areas", column: "administrative_area_id"
  add_foreign_key "dsc_organisations", "dsc_contacts", column: "contact_id"
  add_foreign_key "dsc_phone_numbers", "dsc_contacts", column: "contact_id"
end
