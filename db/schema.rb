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

ActiveRecord::Schema.define(version: 20140428005621) do

  create_table "temperature_humidities", force: true do |t|
    t.text     "log_date"
    t.text     "log_time"
    t.float    "temperature"
    t.float    "humidity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
  end

  add_index "temperature_humidities", ["log_date"], name: "index_temperature_humidities_on_log_date"
  add_index "temperature_humidities", ["log_time"], name: "index_temperature_humidities_on_log_time"
  add_index "temperature_humidities", ["place_id"], name: "index_temperature_humidities_on_place_id"

end
