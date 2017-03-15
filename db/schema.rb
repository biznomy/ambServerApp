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

ActiveRecord::Schema.define(version: 20141030071347) do

  create_table "accounts", force: true do |t|
    t.datetime "date"
    t.float    "amount"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
    t.integer  "booking_id"
  end

  add_index "accounts", ["booking_id"], name: "index_accounts_on_booking_id"
  add_index "accounts", ["vendor_id"], name: "index_accounts_on_vendor_id"

  create_table "addons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "role"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "bookingaddons", force: true do |t|
    t.integer "booking_id"
    t.integer "addon_id"
  end

  add_index "bookingaddons", ["addon_id"], name: "index_bookingaddons_on_addon_id"
  add_index "bookingaddons", ["booking_id"], name: "index_bookingaddons_on_booking_id"

  create_table "bookings", force: true do |t|
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.integer  "vehicle_id"
    t.integer  "driver_id"
    t.string   "fadd1"
    t.string   "fadd2"
    t.string   "fadd3"
    t.string   "tadd1"
    t.string   "tadd2"
    t.string   "tadd3"
    t.string   "breakdowndetails"
    t.integer  "feedback"
    t.boolean  "feedbackrating",   default: true
    t.integer  "paymentmode"
    t.integer  "servicetype"
    t.text     "specialnotes"
    t.float    "price"
    t.integer  "status",           default: 1
    t.integer  "vehiclestatus",    default: 0
  end

  add_index "bookings", ["driver_id"], name: "index_bookings_on_driver_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"
  add_index "bookings", ["vehicle_id"], name: "index_bookings_on_vehicle_id"
  add_index "bookings", ["vendor_id"], name: "index_bookings_on_vendor_id"

  create_table "driverprofiles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "driver_id"
  end

  add_index "driverprofiles", ["driver_id"], name: "index_driverprofiles_on_driver_id"

  create_table "drivers", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
    t.string   "authentication_token"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "drivers", ["authentication_token"], name: "index_drivers_on_authentication_token", unique: true
  add_index "drivers", ["confirmation_token"], name: "index_drivers_on_confirmation_token", unique: true
  add_index "drivers", ["email"], name: "index_drivers_on_email", unique: true
  add_index "drivers", ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true
  add_index "drivers", ["vendor_id"], name: "index_drivers_on_vendor_id"

  create_table "userprofiles", force: true do |t|
    t.string   "full_name"
    t.string   "medical_info"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "userprofiles", ["user_id"], name: "index_userprofiles_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vehicleaddons", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vehicle_id"
    t.integer  "addon_id"
  end

  add_index "vehicleaddons", ["addon_id"], name: "index_vehicleaddons_on_addon_id"
  add_index "vehicleaddons", ["vehicle_id"], name: "index_vehicleaddons_on_vehicle_id"

  create_table "vehicles", force: true do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
  end

  add_index "vehicles", ["vendor_id"], name: "index_vehicles_on_vendor_id"

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.float    "price"
    t.text     "description"
    t.text     "termcondition"
  end

  add_index "vendors", ["admin_id"], name: "index_vendors_on_admin_id"

end
