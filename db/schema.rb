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

ActiveRecord::Schema.define(version: 20171016201144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "hotels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade, comment: "Hotels table" do |t|
    t.uuid "offer_id"
    t.string "beg"
    t.string "end"
    t.datetime "name", comment: "Name of hotel"
    t.string "htc", comment: "Tour description"
    t.string "star", comment: "Star rate of hotel"
    t.string "room", comment: "Room of hotel"
    t.string "rmc"
    t.string "place"
    t.string "plc"
    t.string "meal"
    t.string "mlc"
    t.string "town", comment: "Town of hotel"
    t.string "cnt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_hotels_on_offer_id"
  end

  create_table "offers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade, comment: "Offers table" do |t|
    t.string "operator", comment: "Tour operator name"
    t.string "spo", comment: "Code of special price offer"
    t.datetime "date", comment: "Date of offer"
    t.string "tour", comment: "Tour description"
    t.string "adl"
    t.string "chd"
    t.string "inf"
    t.string "currency", comment: "Currency of offer"
    t.string "country", comment: "Country of offer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade, comment: "Prices table" do |t|
    t.uuid "offer_id"
    t.integer "remote_id"
    t.string "date"
    t.string "n"
    t.datetime "val"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_prices_on_offer_id"
  end

  create_table "services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade, comment: "Services table" do |t|
    t.uuid "offer_id"
    t.string "beg"
    t.string "end"
    t.datetime "type"
    t.string "name", comment: "Name service"
    t.string "cnt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_services_on_offer_id"
  end

  create_table "transports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade, comment: "Transports table" do |t|
    t.uuid "offer_id"
    t.string "beg"
    t.string "end"
    t.datetime "type"
    t.string "name", comment: "Name transport company"
    t.string "trc"
    t.string "class", comment: "Class of transport"
    t.string "place", comment: "Palce of transport"
    t.string "townfr", comment: "Go from town"
    t.string "townto", comment: "Go to town"
    t.string "cnt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_transports_on_offer_id"
  end

end
